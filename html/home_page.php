<?php
    
    if(  isset($_SESSION['login?'])  )
    {
        if($_SESSION['login?'])
        {
            echo "已登入";
            echo "歡迎: ".$_SESSION['name'];
        }
        else
        {
            echo "未登入";
        }
    }
    else{
        echo "未進行登入作業";
    }
?>