<?php
	$conn = mysqli_connect('localhost','root','','chiakibbq')
			or die('Cannot connect to database!');
	mysqli_query($conn,"SET NAMES 'utf8'");

	if(isset($_REQUEST['getLoaiMon'])){
		$data = array();
		$other = array();
		$sql = "SELECT * FROM loaimon ORDER BY TenLoaiMon";
		$result = mysqli_query($conn,$sql);
		if(mysqli_num_rows($result)>0){
			while($row = mysqli_fetch_assoc($result)){
				if($row['TenLoaiMon']  == "Khác") $other = $row;
				else $data[] = $row;
			}
			$data[] = $other;
		}
		die(json_encode($data));
	}

	if(isset($_REQUEST['getDsMon'])){
		$data = array();
		$sql = "SELECT * FROM Mon WHERE IdLoaiMon = {$_REQUEST['IdLoaiMon']} ORDER BY TenMon";
		$result = mysqli_query($conn, $sql);
		if(mysqli_num_rows($result)>0){
			while($row = mysqli_fetch_assoc($result)){
				$data[] = $row;
			}
		}
		die(json_encode($data));
	}
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

	if(isset($_REQUEST['tang'])){
		$data = array();
		$sql = "SELECT * FROM dsBan WHERE TenBan LIKE '{$_REQUEST['tang']}%'";
		$result = mysqli_query($conn,$sql);
		if(mysqli_num_rows($result)>0){
    		while($row = mysqli_fetch_assoc($result)){
        		$data[] = $row;
    		}
		}
		die(json_encode($data));
	}
	
	if(isset($_REQUEST['tenban'])){
		$data = array();
		$sql = "SELECT * FROM
					(SELECT IdDatMon, IdMon, TenBan, TenMon, SoLuong, TGKhachNhan, TGKhachDat, TrangThai, TraBan
						FROM DatMon, Mon 
                    	WHERE TenBan = '{$_REQUEST['tenban']}' AND DatMon.IdMon = Mon.Id AND TraBan=0) As T1
                LEFT JOIN (SELECT TenMon AS TenMon2, Sum(SoLuong) AS Tong
                            FROM Mon, DatMon
                            WHERE Mon.Id = DatMon.IdMon AND TrangThai = 0
                            Group By TenMon) AS T2
                On  T1.TenMon = T2.TenMon2 ORDER BY TGKhachDat";
        $result=mysqli_query($conn, $sql);
        if(mysqli_num_rows($result)>0){
            while ($row = mysqli_fetch_assoc($result)){
                unset($row['TenMon2']);
                $data[] = $row;
            }
        }
		die(json_encode($data));
	}

	if(isset($_REQUEST['refresh'])){
		$data = array();
		$sql = "SELECT * FROM dsBan";
		$result = mysqli_query($conn, $sql);
		if(mysqli_num_rows($result)>0){
			while($row = mysqli_fetch_assoc($result)){
				$data[] = $row;
			}
		}
		die(json_encode($data));
	}
?>
