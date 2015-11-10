<?php
	$conn = mysqli_connect('localhost','root','','chiakibbq')
			or die('Cannot connect to database!');
	mysqli_query($conn,"SET NAMES 'utf8'");

	if(isset($_REQUEST['datmon'])){
		if(isset($_REQUEST['idMon']) && isset($_REQUEST['slMon']) && isset($_REQUEST['tenBan'])){
	        $sql = "INSERT INTO datmon(IdMon, TenBan, SoLuong)
	                VALUES({$_REQUEST['idMon']},'{$_REQUEST['tenBan']}',{$_REQUEST['slMon']})";
	        mysqli_query($conn,$sql);

	        $sql = "UPDATE dsBan
	                SET Mau = 'red'
	                WHERE TenBan = '{$_REQUEST['tenBan']}'";
	        mysqli_query($conn,$sql);

			$sql = "UPDATE dsBan
	                SET LamMoi = 1
	                WHERE TenBan IN (SELECT TenBan FROM DatMon
	                                    WHERE IdMon = {$_REQUEST['idMon']} AND TraBan = 0)";
	        mysqli_query($conn,$sql);
		}
	}

	if(isset($_REQUEST['resetLamMoi'])){
		$sql = "UPDATE dsBan
				SET LamMoi = 0
				WHERE TenBan = {$_REQUEST['tenban']}";
		mysqli_query($conn,$sql);
	}

	if(isset($_REQUEST['huydatmon'])){
		if(isset($_REQUEST['bepdanhan'])){
			$sql = "UPDATE DatMon SET TrangThai = 5
					WHERE IdDatMon='{$_REQUEST['idDMon']}'";
			mysqli_query($conn,$sql);
		} else {
	        //delete the record
	        $sql = "DELETE FROM DatMon
	                WHERE IdDatMon='{$_REQUEST['idDMon']}'";
        	mysqli_query($conn,$sql);

			$sql = "SELECT IdDatMon FROM DatMon
					WHERE TenBan = '{$_REQUEST['tenBan']}'
					AND TraBan = 0";
			$rs = mysqli_query($conn,$sql);
			$red = false;
			$color = '#f6f6f6';
			if(mysqli_num_rows($rs) > 0){
				while($row = mysqli_fetch_assoc($rs)){
					if($row['TrangThai'] == 0 || $row['TrangThai'] == 1){
						$red = true;
						break;
					}
				}
				if($red) $color = 'red';
				else $color = 'yellow';
			}

			$sql = "UPDATE dsBan
	        		SET Mau = '{$color}'
	        		WHERE TenBan ='{$_REQUEST['tenBan']}'";
    		mysqli_query($conn,$sql);

	        $sql = "UPDATE dsBan
	        		SET LamMoi = 1
	        		WHERE TenBan IN (SELECT TenBan FROM DatMon WHERE IdMon = {$_REQUEST['idMon']})";
	        mysqli_query($conn,$sql);
		}
	}

	if(isset($_REQUEST['khachnhanmon'])){
		date_default_timezone_set("Asia/Ho_Chi_Minh");    
        $t = date("Y-m-d H:i:s");
        $sql = "UPDATE DatMon
                SET   TrangThai =  4 , TGKhachNhan = '{$t}'
                WHERE IdDatMon  =  '{$_REQUEST['idDMon']}' AND TraBan = 0";
        mysqli_query($conn, $sql);
		
		$sql = "UPDATE dsBan
                SET LamMoi = 1
                WHERE TenBan = '{$_REQUEST['tenBan']}'";
        mysqli_query($conn,$sql);
	}

	if(isset($_REQUEST['traban'])){
		$sql = "UPDATE DatMon
                SET TraBan = 1
                WHERE TraBan = 0 AND TenBan = '{$_REQUEST['tenBan']}'";
        mysqli_query($conn,$sql);
        
        $sql = "UPDATE dsBan
                SET Mau = '#f6f6f6', LamMoi = 1
                WHERE TenBan = '{$_REQUEST['tenBan']}'";
        mysqli_query($conn,$sql);
	}
?>