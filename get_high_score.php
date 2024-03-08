<?php
header("Content-Type:application/json");
require('db.php');


$query = "SELECT MAX(score) as maxScore FROM `scores`";
$result = mysqli_query($conn, $query) or die(mysqli_error($conn));
$rows = mysqli_num_rows($result);

if ($rows == 1) {
    $data = mysqli_fetch_assoc($result);
    $score = $data['maxScore'];
    response(true, $score);
} else {
    response(false);
}

function response($status, $score)
{
    $response['saved'] = $status;
    $response['score'] = $score;
    $json_response = json_encode($response);
    echo $json_response;
}
