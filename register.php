<?php
require('db.php');

$eror_msg = "";
$show_form = false;

if (isset($_POST['username'])) {
    $var = 0;
    if (isset($_POST['Email'])) {
        $username = ($_POST['username']);
        $Email = ($_POST['Email']);
        $password = ($_POST['password']);

        if (!filter_var($Email, FILTER_VALIDATE_EMAIL)) {
            $msg = 'The Email you have entered is invalid, please try again.';
            echo $msg;
        } else {
            $username = $_REQUEST['username'];
            $query = "SELECT * FROM `users` WHERE `username`='$username'";
            $result = mysqli_query($conn, $query) or die(mysqli_error($conn));
            $rows = mysqli_num_rows($result);
            if ($rows == 0) {
                $query = "INSERT INTO `users` (`username`, `password`, `Email`) VALUES ('$username', '$password', '$Email');";
                $result1 = mysqli_query($conn, $query);
                if ($result1) {
                    $username = $_REQUEST['username'];
                    $query = "SELECT * FROM `users` WHERE `username`='$username'";
                    $result = mysqli_query($conn, $query) or die(mysqli_error($conn));
                    $rows = mysqli_num_rows($result);
                    if ($rows == 1) {
                        session_start();
                        $user_data = mysqli_fetch_assoc($result);
                        $_SESSION['user_id'] = $user_data['id'];
                        header("Location: index.php");
                    }
                }
            }else{
                $show_form=true;
                $eror_msg = "username already excists";
            }
        }
    }
    $conn->close();
} else {
    $show_form =true;
}

?>


<?php 

if($show_form){ ?>

    <div class="form">

    <?php if($eror_msg!='') { ?>
        <div class="erorr-message"><?php echo $eror_msg ?></div>
        <?php } ?>
        <h1>Register Here!!</h1>
        <form name="registration" action="" method="post">
            <input type="text" name="username" placeholder="username" required />
            <input type="Email" name="Email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" name="submit" value="Click me to Register" />
        </form>
    </div>



<?php } ?>