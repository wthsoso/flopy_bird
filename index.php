<?php require('check_login.php') ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <canvas class="game_board" id="gameCanvas"></canvas>

    <form id="logoutForm" action="logout.php" method="post">
        <input type="submit" value="Log Out">
    </form>

    <div id="show-player-list">
        <button id="button">Display Player Scores</button>
    </div>
    <div id="player-list" class="popup">
        <div>X</div>
        <div id="player-list-content"></div>
    </div>
    <script>
        const userID = <?php echo json_encode($_SESSION['user_id'], JSON_HEX_TAG); ?>;
    </script>
    <script src="js/script.js"></script>
    <script src="js/players.js"></script>
</body>

</html>