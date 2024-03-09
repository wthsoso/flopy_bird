<?php
header("Content-Type: application/json");
require('db.php');

$topscore_query = "SELECT  t1.score, t2.username FROM scores t1 
INNER JOIN users t2 ON t1.user_id = t2.id 
ORDER BY t1.score DESC LIMIT 10";

$result = mysqli_query($conn, $topscore_query) or die(mysqli_error($conn));

$rows = array();
while ($row = mysqli_fetch_assoc($result)) {
    $rows[] = $row;
}

echo json_encode($rows);
?>
