<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
//
// $conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME, $DB_PORT);
//
// if ($conn->connect_error) {
//     die("Connection failed: " . $conn->connect_error);
// }
require 'connection.php';
$data = json_decode(file_get_contents('php://input'), true);
$isSeller = $data['isSeller'];
$id = $data['id'];

if ($isSeller == "true") {
    $sql = "Select b.bid_price,b.bid_quantity,b.user_id as buyer_id,p.prod_id,p.remaining_qty,p.category_id,p.user_id from product p INNER JOIN product_bid b ON b.product_id=p.prod_id where b.prod_bid_id = $id";
    if ($result = $conn->query($sql)) {
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

        /////update on the reamaining_qty
        $price_bid = $row['bid_price'];
        $quantity_bid = $row['bid_quantity'];
        $buyer_id = $row['buyer_id'];
        $seller_id = $row['user_id'];
        $prod_id = $row['prod_id'];
        $remaining_qty = $row['remaining_qty'];
        $category = $row['category_id'];
        $date_time = date("Y-m-d H:i:s");

        if ($remaining_qty - $quantity_bid < 0) {
            $response = array('response_code' => 404,);
            echo json_encode($conn->error);
        } else {

            ////check buyer has that product and has sufficent amount of it;
            $sql = "Select * from requirement where category=$category and user_id = $buyer_id";
            if ($result = $conn->query($sql)) {
                $list_of_products = array();

                while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                    array_push($list_of_products, $row);
                }
                ////check if buyer has that product
                if (count($list_of_products) != 0) {
                      ////check if buyer has sufficent remaining_qty
                    if ($list_of_products[0]['remaining_qty'] >= $quantity_bid) {
                        ////buyer has sufficent remaining_qty so update remaining_qty\\
                        $remaining_qty -= $quantity_bid;

                        $remaining_qty_product = $list_of_products[0]['remaining_qty'] - $quantity_bid;
                        $req_id = $list_of_products[0]['req_id'];
                        $sql = "Update requirement set remaining_qty = $remaining_qty_product where req_id=$req_id";
                        $conn->query($sql);

                        $sql = "UPDATE product SET remaining_qty = $remaining_qty where prod_id=$prod_id";
                        if ($result = $conn->query($sql)) {
                            ///set is accepted to 1
                            $sql = "UPDATE product_bid SET is_accepted = 1 where prod_bid_id=$id";
                            $conn->query($sql);


                            ///set data in the transaction
                            $sql = "INSERT INTO `transaction`(`buyer_id`, `seller_id`, `bid_id`, `start_date`, `is_product_bid`)
                VALUES ($buyer_id,$seller_id,$id,'$date_time',1)";


                            if ($conn->query($sql)) {
                                $response = array('response_code' => 101,);
                                echo json_encode($response);
                            } else {
                                $response = array('response_code' => 404,);
                                echo json_encode($conn->error);
                            }
                        } else {
                            $response = array('response_code' => 404,);
                            echo json_encode($conn->error);
                        }
                    } else {
                        $response = array('response_code' => 406,);
                        echo json_encode($response);
                    }
                }
            } else {
                $response = array('response_code' => 404,);
                echo json_encode($conn->error);
            }
        }
    } else {
        $response = array('response_code' => 404,);
        echo json_encode($conn->error);
    }
} else {
    $sql = "Select b.bid_price,b.bid_quantity,b.user_id as seller_id,r.req_id,r.user_id,r.remaining_qty,r.category from requirement as r INNER JOIN requirement_bid as b ON b.req_id=r.req_id where b.req_bid_id = $id";
    if ($result = $conn->query($sql)) {
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

        /////update on the reamaining_qty
        $price_bid = $row['bid_price'];
        $quantity_bid = $row['bid_quantity'];
        $buyer_id = $row['user_id'];
        $seller_id = $row['seller_id'];
        $req_id = $row['req_id'];
        $remaining_qty = $row['remaining_qty'];
        $category = $row['category'];
        $date_time = date("Y-m-d H:i:s");

        if ($remaining_qty - $quantity_bid < 0) {
            $response = array('response_code' => 407,);
            echo json_encode($response);
        } else {
            ////check seller has that product and has sufficent amount of it;
            $sql = "Select * from product where category_id=$category and user_id = $seller_id";
            if ($result = $conn->query($sql)) {
                $list_of_products = array();

                while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                    array_push($list_of_products, $row);
                }
                if (count($list_of_products) != 0) {
                    /////check for the quantity
                    if ($list_of_products[0]['remaining_qty'] >= $quantity_bid) {
                        //////update product_id
                        $remaining_qty_product = $list_of_products[0]['remaining_qty'] - $quantity_bid;
                        $prod_id = $list_of_products[0]['prod_id'];
                        $sql = "Update product set remaining_qty = $remaining_qty_product where prod_id=$prod_id";
                        $conn->query($sql);
                        //////update requirement
                        $remaining_qty -= $quantity_bid;
                        $sql = "UPDATE requirement SET remaining_qty = $remaining_qty where req_id=$req_id";
                        if ($result = $conn->query($sql)) {
                            ///update requuirement bid and set is accepted to 1
                            $sql = "UPDATE requirement_bid SET is_accepted = 1 where req_bid_id=$id";
                            $conn->query($sql);

                            ////initaite transaction
                            $sql = "INSERT INTO `transaction`(`buyer_id`, `seller_id`, `bid_id`, `start_date`, `is_product_bid`)
                        VALUES ($buyer_id,$seller_id,$id,'$date_time',0)";
                            if ($conn->query($sql)) {
                              $last_id = mysqli_insert_id($conn);
                                $response = array('response_code' => 101,'transaction_id'=>$last_id);
                                echo json_encode($response);
                            } else {
                                $response = array('response_code' => 404,);
                                echo json_encode($conn->error);
                            }
                        } else {
                            $response = array('response_code' => 404,);
                            echo json_encode($conn->error);
                        }
                    } else {
                        $response = array('response_code' => 406,);
                        echo json_encode($response);
                    }
                } else {
                    $response = array('response_code' => 405,);
                    echo json_encode($response);
                }
            } else {
                $response = array('response_code' => 406,);
                echo json_encode($response);
            }
        }
    }
}

$conn->close();
