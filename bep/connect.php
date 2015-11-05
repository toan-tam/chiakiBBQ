<?php
    $conn = mysqli_connect('localhost', 'root', '', 'chiakibbq') or die ('Can not connect to mysql');
    mysqli_query($conn,"SET NAMES 'utf8'");
    $result = array();
    if(isset($_REQUEST['tinhTG'])){
        $sql = "SELECT TGKhachNhan, TGKhachDat FROM DatMon WHERE IdDatMon = {$_REQUEST['IdDatMon']}";
        $result = mysqli_query($conn, $sql);

        $time = '';
        if(mysqli_num_rows($result)>0){

            $row = mysqli_fetch_assoc($result);

            if($row['TGKhachNhan']==$row['TGKhachDat']){

                date_default_timezone_set("Asia/Ho_Chi_Minh");    
                $row['TGKhachNhan'] = date("Y-m-d H:i:s");

            }
            
            $tgDat = strtotime($row['TGKhachDat']);
            $tgNhan = strtotime($row['TGKhachNhan']);

            $time = gmdate('H:i:s',$tgNhan - $tgDat);
        }
        die(json_encode($time));
    }
    if(isset($_REQUEST['act']) && $_REQUEST['act']=='getColor'){
        $sql = "SELECT * FROM dsBan";
        $query = mysqli_query($conn,$sql);
        if(mysqli_num_rows($query)>0){
            while($row = mysqli_fetch_assoc($query)){
                $result[] = $row;
            }
        }
    } else {
        $sql = "SELECT *  FROM
                    (SELECT IdDatMon, DatMon.IdMon, TenBan, TenMon, SoLuong, TGKhachNhan, TGKhachDat, TrangThai
                        FROM DatMon, Mon 
                        WHERE DatMon.IdMon = Mon.id AND TraBan=0) As T1
                LEFT JOIN (SELECT TenMon AS TenMon2, Sum(SoLuong) AS Tong
                            FROM Mon, DatMon
                            WHERE Mon.Id = DatMon.IdMon AND TrangThai = 0
                            Group By TenMon) AS T2
                On  T1.TenMon = T2.TenMon2 ORDER BY TGKhachDat";
        $query=mysqli_query($conn, $sql);
        if(mysqli_num_rows($query)>0){
            while ($row = mysqli_fetch_assoc($query)){
                unset($row['TenMon2']);
                $row['TraBan'] = 0;
                $result[] = $row;
            }
        }   
    }
    die (json_encode($result));
?>