<?php

    $sql = "";
    foreach($_POST as $item=>$content){
        $_POST[$item] = '"'.$content.'"';
    }
    echo '<pre>';
    print_r($_POST);
    echo '</pre>';
  
    $sql = "insert into ".$_GET['table_name'] .'('.implode(',',array_keys($_POST)).') values('.implode(',',$_POST).');';
    print_r($sql);
    include './general.php';
    $conn = mysql_conn();
    if (mysqli_query($conn, $sql)) {
        echo "已完成新增";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
      
    mysqli_close($conn);
    header('Location: /index.php/search?=table_name='.$table);
    die();
?>