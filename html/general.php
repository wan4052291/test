<?php
    // 連線資料庫
    function mysql_conn(){
        $DBNAME = "test4";
        $DBUSER = "user";
        $DBPASSWD = "passwd";
        $DBHOST = "127.0.0.1";
        $conn = new mysqli( $DBHOST, $DBUSER, $DBPASSWD, $DBNAME);
        if (empty($conn)) {
            die ("Connection Error");
            exit;
        }
        mysqli_query( $conn, "SET NAMES 'utf8';");
        return $conn;
    }

    session_start();
?>