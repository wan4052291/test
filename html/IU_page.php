<?php
    $table_list = [
        'dept_view',
        'lic_view',
        'act_view',
        'prc_view',
        'proj_view',
        'race_view',
        'takes_view',
        // '',
        // '',
    ];
    // 欄位 中文對照表
    $column_map = [
        'student_id'=>'學號',
        'student_name'=>'學生姓名',
        // dept
        'dept_name'=>'系所名稱',
        'building_name'=>'大樓名稱',
        // lic
        'license_name'=>'證照名稱',
        'license_id'=>'證照編號',
        // act
        'exp_year'=>'年份',
        'exp_name'=>'幹部名稱',
        'activeexp_id'=>'幹部編號',
        // prc
        'prc_unit'=>'實習單位',
        'prc_year'=>'實習年份',
        'prc_pos'=>'實習職稱',
        'prc_feel'=>'實習心得',
        'prc_content'=>'實習內容',
        'prcexp_id'=>'實習編號',
        // proj
        'proj_title'=>'專題名稱',
        'proj_year'=>'專題年份',
        'proj_url'=>'專題 URL',
        'proj_guide'=>'專題簡介',
        'proj_student_id'=>'學號',
        'proj_id'=>'專題編號',
        // race
        'race_year'=>'競賽年',
        'race_name'=>'競賽名稱',
        'race_type'=>'競賽類型',
        'race_intro'=>'競賽簡介',
        'race_grade'=>'競賽成績',
        'race_id'=>'競賽編號',
        // takes
        'course_id'=>'課程ID',
        'course_name'=>'課程名稱',
        'grade'=>'成績',
    ];
    $column_list = [
        'license_id',
        'activeexp_id',
        'prcexp_id',
        'proj_id',
        'race_id',
    ];
    // get
    isset($_GET['table_name']) ? $table=$_GET['table_name'] : die();

    // sql map
    $sql = " select distinct column_name from information_schema.columns where table_name='$table';";
    // start communcate with database.

    $conn = mysql_conn();
    // query
    $data_table = $conn->query($sql);
    ?>

<form action="/insert.php?table_name=<?php echo $table; ?>" method="post">
    <?php
        while($row=$data_table->fetch_assoc())
        {
            $temp = $row['column_name'];

            if(in_array($temp,$column_list))
                break;

            $temp_wrap = $column_map[$temp];
            
            echo '<div class="form-group">';
            echo "<label for='$temp'>$temp_wrap</label><br>";
            if(($temp=="student_id" || $temp == "proj_student_id" )&& $_SESSION['identity']=="student"){
                $tt = $_SESSION['id'];
                echo "<input type='text' id='$temp' name='$temp' value='$tt' readonly>";
            }
            else{
                echo "<input type='text' id='$temp' name='$temp'>";
            }
            echo '</div>';
        }
    ?>
    <button type="submit" class="btn btn-primary">新增</button>
</form>