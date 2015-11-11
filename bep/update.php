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

    if(isset($_REQUEST['resetClick'])){
        $sql = "UPDATE dsBan
                SET LamMoi = 0
                WHERE TenBan = '{$_REQUEST['tenban']}'";
        mysqli_query($conn,$sql);
    }

    if(isset($_REQUEST['acceptCancel'])){
        $sql = "UPDATE datmon
                SET TrangThai = 6
                WHERE IdDatMon = '{$_REQUEST['ID_DatMon']}'";
        mysqli_query($conn,$sql);

        $sql = "SELECT * FROM DatMon
                WHERE TenBan = '{$table}' AND TraBan = 0 AND TrangThai IN (0,1)";
        $result = mysqli_query($conn,$sql);
        if(mysqli_num_rows($result)==0){
            $sql = "UPDATE dsban
                    SET Mau = 'yellow'
                    WHERE tenban = '{$_REQUEST['tenBan']}'";
            mysqli_query($conn,$sql);
        }
        
        $sql = "UPDATE dsban
                SET LamMoi = 2
                WHERE tenban = '{$_REQUEST['tenBan']}'";
        mysqli_query($conn,$sql);
    }

    if(isset($_REQUEST['ignoreCancel'])){
        $sql = "UPDATE datmon
                SET TrangThai = 7
                WHERE IdDatMon = '{$_REQUEST['ID_DatMon']}'";
        mysqli_query($conn,$sql);

        $sql = "UPDATE dsban
                SET LamMoi = 2
                WHERE tenban = '{$_REQUEST['tenBan']}'";
        mysqli_query($conn,$sql);
    }