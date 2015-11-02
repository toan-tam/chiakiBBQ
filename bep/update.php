<?php
    $conn = mysqli_connect('localhost', 'root', '', 'chiakibbq') 
            or die ('Can not connect to mysql');

    if(isset($_REQUEST['update'])){
        $update = $_REQUEST['update'];
        $table = $_REQUEST['ten_ban'];
        $trangthai = $_REQUEST['trangthai'];
        $idDatMon = $_REQUEST['ID_DatMon'];

        $sql = "UPDATE datmon SET TrangThai = {$trangthai}
                WHERE IdDatMon = {$idDatMon}";
        mysqli_query($conn,$sql);

        $sql = "UPDATE dsBan
                SET LamMoi = 2
                WHERE TenBan = '{$table}'";
        mysqli_query($conn,$sql);

        if($update == 'danhan'){
            $sql = "UPDATE dsBan
                SET Mau = 'red'
                WHERE TenBan = '{$table}'";
            mysqli_query($conn,$sql);
        }

        if($update == 'dagui' || $update == 'dahuy'){
            $sql = "SELECT * FROM DatMon
                    WHERE TenBan = '{$table}' AND TraBan = 0 AND TrangThai IN (0,1)";
            $result = mysqli_query($conn,$sql);
            if(mysqli_num_rows($result)==0){
                $color = 'yellow';
            } else $color = 'red';

            $sql = "UPDATE dsBan
                SET Mau = '{$color}'
                WHERE TenBan = '{$table}'";
            mysqli_query($conn,$sql);
        }
    }

    if(isset($_REQUEST['tenban']) && isset($_REQUEST['act']) && $_REQUEST['act']=='resetClick'){
        // If click = 3 then both page have to reload table#tenban so if one page reload,
        // it's necessary to set the click value as 1||2
        // to make sure the other page will be reload table#tenban
        if($_REQUEST['click']==3){
            if($_REQUEST['mode']==1){
                $click = 2;
            } else $click = 1;
        } else $click = 0;  //Or Else, set the table click value as 0
                            //to make sure it will not be unnecessarily reloaded
        $sql = "UPDATE dsBan
                SET LamMoi = {$click}
                WHERE TenBan = '{$_REQUEST['tenban']}'";
        mysqli_query($conn,$sql);
    }