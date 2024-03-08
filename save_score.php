<?php 
header("Content-Type:application/json");
require('db.php');

$json = file_get_contents('php://input');
$data = json_decode($json);

if ($data) {
    $user_id = $data->user_id;
    $score = $data->score;

    $stmt = $conn->prepare("INSERT INTO `scores` (`user_id`, `score`) VALUES (?, ?)");
    $stmt->bind_param("ii", $user_id, $score);

    
    if ($stmt->execute()) {
        response(true);
    } else {
        response(false);
    }
   
    $stmt->close();
    $conn->close();
} else {
    response(false);
}

function response($status)
{
    $response['saved'] = $status;
    $json_response = json_encode($response);
    echo $json_response;
}
?>
