<!DOCTYPE html>
<?php
    include('./general.php');
    $routes = array(
        ''      =>'./home_page.php',
        '/'      => './home_page.php',
        '/search' => './search.php',
        '/login' => './login_page.php',
        '/IU' => './IU_page.php',
    );

    function router($routes)
    {
        if(!isset($_SERVER['PATH_INFO'])){
            include($routes['']);
            return;
        }
        foreach ($routes as $path => $content) {
            if ($path == $_SERVER['PATH_INFO']) {
                include($content);
                return;
            }
        }
        echo 'Sorry! Page not found';
    }

?>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首頁</title>
    <!-- jquery, bootstrap4 need this, so put it infront of bootstrap4-->
    <script src="/js_file/jquery-3.6.0.min.js"></script>
    <!-- jcanvas -->
    <!-- <script src="/js_file/jcanvas.min.js"></script> -->
    <!-- Popper.JS -->
    <script src="/js_file/popper.min.js"></script>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/bootstrap-4.6.1/dist/css/bootstrap.min.css">
    <!-- Bootstrap JS -->
    <script src="/bootstrap-4.6.1/dist/js/bootstrap.min.js"></script>

    <!-- own style -->
    <link rel="stylesheet" href="/p13.css">
    <link rel="stylesheet" href="/style.css">
    
    <!-- Font Awesome JS -->
    <script defer src="/js_file/solid.js"></script>
    <script defer src="/js_file/fontawesome.js"></script>
    
    <!-- own js -->
    <script src="/js_file/common_func.js"></script>
</head>

<body>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3><b>學生學習歷程平台</b></h3>
            <strong></strong>
        </div>

        <ul class="list-unstyled components">
            <li class="active">
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fas fa-home"></i>
                    新增資料
                </a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <?php
                        error_reporting(0);
                        $student_new_list = [
                            '修課'=>'takes',
                            '證照'=>'license',
                            '競賽'=>'raceexp',
                            '專題'=>'project',
                            '活動幹部經驗'=>'activeexp',
                            '實習經驗'=>'prcexp',
                        ];
                        $staff_new_list = [
                            '學生'=>'student',
                            '修課'=>'takes',
                        ];
                        
                        foreach(($_SESSION['identity']=='staff'?
                        $staff_new_list:$student_new_list) as $i=>$j){
                            echo '<li>';
                            echo '<a href="/index.php/IU?table_name='.$j.'">'.$i.'</a>';
                            echo '</li>';
                        }
                    ?>
                </ul>
            </li>


            <li>
                <a href="#">
                    <i class="fas fa-image"></i>
                    專題組員
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-question"></i>
                    FAQ
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-paper-plane"></i>
                    聯繫我們
                </a>
            </li>
        </ul>

    </nav>

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>收起左側選單</span>
                    </button>

                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                    
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="/index.php">首頁</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="/index.php/search">查詢</a>
                            </li>
                            
                            <li class="nav-item active">
                                <a class="nav-link" href="/index.php/login">登入</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="/logout.php">登出</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </nav>

            <div class="d-flex flex-column" id="main_content">
                <?php router($routes); ?>
            </div>
            
           
            
        </div>
    </body>
</html>