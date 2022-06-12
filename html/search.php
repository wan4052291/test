<?php
    $table_list = [
        'dept_view',
        'lic_view',
        'act_view',
        'prc_view',
        'proj_view',
        'race_view',
        'takes_view',
        'student',
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
?>
<div>
    <form action="/index.php/search" method="get">
        <select name="table_name" id="">
            <?php
                foreach($table_list as $tb){
                    echo "<option value='$tb'>$tb</option>";
                }
            ?>
        </select>
        <button type="submit">查詢</button>
    </form>
</div>
<?php

    // session
    $stu_id = $_SESSION['id'];

    // get
    isset($_GET['table_name']) ? $table=$_GET['table_name'] : die();

    // sql map
    $sql = "select * from $table where student_id=$stu_id;";
    $sql_staff = "select * from $table;";
    // start communcate with database.
    $conn = mysql_conn();
    // query
    $data_table = $conn->query($sql);
    $data_table_staff = $conn->query($sql_staff);

    
    // is empty?
    if( (empty($data_table)&& $_SESSION['identity']=="student")||(empty($data_table_staff)&& $_SESSION['identity']=="staff"))
    {
        mysqli_error($conn);
        echo '<b>There is no data</b>';
        die();
    }
    
    if( $_SESSION['identity']=="student")
    {
            // field list
        $column_list=[];
        for($temp =0 ; $temp<mysqli_num_fields($data_table); $temp++)
        {
            $column_list []= $column_map[mysqli_fetch_field_direct($data_table,$temp)->name];
        }
    }
    else
    {
        $column_list_satff=[];
        for($temp =0 ; $temp<mysqli_num_fields($data_table_staff); $temp++)
        {
            $column_list_satff []= $column_map[mysqli_fetch_field_direct($data_table_staff,$temp)->name];
        }
    }
   

    ?>
<div class="a_top">
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <?php
                    if($_SESSION['identity']=="student")
                    {
                        foreach($column_list as $fd)
                        {
                            echo '<th>'.$fd.'</th>';
                        }
                    }
                    else
                    {
                        foreach($column_list_satff as $fd)
                        {
                            echo '<th>'.$fd.'</th>';
                        }
                    }
                ?>
            </tr>
        </thead>
        <tbody>
            <?php
                if($_SESSION['identity']=="staff")
                {
                    while($row_staff=mysqli_fetch_row($data_table_staff))
                    {
                        echo '<tr>';
                        for($i=0; $i<mysqli_num_fields($data_table_staff); $i++)
                        {
                            if(substr($row_staff[$i],0,4)=="http")
                            {
                                $temp=$row_staff[$i];
                                echo "<td><a href='$temp'>前往</a></td>";
                            }
                            else
                            {
                                echo '<td>'.$row_staff[$i].'</td>';
                            }
                        }
                        echo '</tr>';
                    }
                }
                else
                {
                    while($row=mysqli_fetch_row($data_table))
                    {
                        echo '<tr>';
                        for($i=0; $i<mysqli_num_fields($data_table); $i++)
                        {
                            if(substr($row[$i],0,4)=="http")
                            {
                                $temp=$row[$i];
                                echo "<td><a href='$temp'>前往</a></td>";
                            }
                            else
                            {
                                echo '<td>'.$row[$i].'</td>';
                            }
                        }
                        echo '</tr>';
                    }

                }
                
            ?>
        </tbody>
    </table>
</div>
