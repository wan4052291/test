<?php
    include 'general.php';
    $conn = mysql_conn();

    mysqli_query( $conn, "SET NAMES 'utf8';");

    // account -> student_name
    // password -> student_id
    $acc = $_POST['account'];
    $pw = $_POST['password'];
    $iden = $_POST['identity'];

    $sql ="select * from $iden where ".$iden."_name='$acc' and ".$iden."_id='$pw';";

    $result = mysqli_query($conn, $sql);
    if($result==false)
    {
        mysqli_error($conn);
        echo '<b>SQL Error</b>';
        die();
    }
    
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
    if(empty($row)){
        echo '<b>There is no such user</b>';
        die();
    }

    // session_start();
    $_SESSION['login?'] = true;
    $_SESSION['name'] = $acc;
    $_SESSION['id'] = $pw;
    $_SESSION['identity'] = $iden;
    
    header('Location: /index.php');
    die();
?>