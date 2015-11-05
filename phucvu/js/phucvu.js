function chonTang(tang){
	$('.dsban').css('display','none');
	$('.dsban').html('');
	$.ajax({
		url		: 'connect.php?tang='+tang,
		type 	: 'GET',
		async	: false,
		dataType: 'json',
		success : function(data){
			$.each(data,function(key,item){
				var ban = '<button id="'+item['TenBan']+'" class="nutbam">'+item['TenBan']+'</button>';
				$('.dsban').append(ban).fadeIn(200);
				$('#'+item['TenBan']+'').css('background',item['Mau']);
			});
		}
	});
}

function canhbao(tinnhan){
	$('#thongbao').dialog({
		modal	: true,
		title	: 'Chú ý!',
		open	: function(){
			$(this).html(tinnhan);
		},
		buttons	: {
			'Đóng' : function(){
				$('#thongbao').dialog('close');
			}
		}
	}).css('font','20px Arial');
}


function timer(IdDatMon){
    $.ajax({
        url     : 'connect.php?tinhTG&IdDatMon='+IdDatMon,
        type    : 'GET',
        dataType: 'json',
        async   : false,
        success : function(data){
            var time = data.split(':');
            if(time[1]>=10 || time[0]>0) data='<span style="color:red">'+data+'</span>';
            $('table#dsmon tr[id-order="'+IdDatMon+'"] .thoigiandoi').html(data);
        }
    });
}

$(document).ready(function(){

	chonTang('1'); //Hien thi ds ban o tang 1
	
	//Hien thi danh sach mon de datmon
	$('.datmon #mon').html('');
	$.ajax({
		url		: 'connect.php?getDsMon',
		type 	: 'GET',
		async	: false,
		dataType: 'json',
		success	: function(data){
			$.each(data,function(key,item){
				var option = '<option id="'+item['Id']+'" value="'+item['Id']+'">'+item['TenMon']+'</option>';
				$('.datmon #mon').append(option);
			});
		}
	});
	//Thay doi danh sach ban khi chon tang khac
	$('#chonTang').change(function(){
		var tang = $(this).val();
		chonTang(tang);
	});


	var tenban = '', khachnhan = 0;
	var clickban_check = true;
	check = false;
	$('.dsban').on('click','.nutbam',function(){
		//Hien thi chi tiet ban
		$('.page1').fadeOut(100,function(){
			$('.page2').fadeIn(100);
		});

		if (clickban_check) {
			$("#mon").combify();
			clickban_check = false;
		};
		
		$('#CombifyInput-mon').css('height','25px').parent().parent().css({'float':'left', 'margin-right':'5px'});
		$('#CombifyInput-mon').focus(function () {
			$(this).attr('value', '');
		});
		tenban = $(this).attr('id');
		$('#tenban').html(tenban);

		//Hien thi danh sach mon da duoc dat cua ban
		$('table#dsmon .chitiet').remove();
		$.ajax({
			url		: 'connect.php?tenban='+tenban,
			type 	: 'GET',
			async	: false,
			dataType: 'json',
			success	: function(data){
				var somon = 0;
				khachnhan = 0;
				$.each(data,function(key,item){
					somon++;
					$('.invisible table.mon .tenmon').html(item['TenMon']);
					$('.invisible table.mon .soluong').html(item['SoLuong']);
					var tinhtrang='';
					switch(item['TrangThai']){
						case '0':
							tinhtrang = 'Đang gửi lên bếp';
							$('.invisible table.mon .tinhtrang').css({'background': '','color': '', 'font-weight': ''});
							break;
						case '1': 
							tinhtrang = 'Bếp đã nhận';
							$('.invisible table.mon .tinhtrang').css({'background': 'red','color': '#FFF', 'font-weight': 'bold'});
							break;
						case '2': 
							tinhtrang = 'Bếp đã gửi xuống';
							$('.invisible table.mon .tinhtrang').css({'background': 'yellow','color': '', 'font-weight': 'bold'});
							break;
						case '3':
							tinhtrang = 'Bếp hủy món';
							$('.invisible table.mon .tinhtrang').css({'background': 'darkgreen','color': '#FFF', 'font-weight': 'bold'});
							break;
						case '4':
							tinhtrang = 'Khách đã nhận';
							$('.invisible table.mon .tinhtrang').css({'background': '','color': '', 'font-weight': ''});
							khachnhan++;
							$('.invisible table.mon button.khachnhan').addClass('active');
							$('.invisible table.mon tr').addClass('disabled');
							break;
					}
					$('.invisible table.mon .tinhtrang').html(tinhtrang);
					$('.invisible table.mon tr').attr('id-order',item['IdDatMon']);
					var temp = $('.invisible table.mon').html();
					$('table#dsmon').append(temp);
					timer(item['IdDatMon']);
                    if(item['TrangThai']!='4'){
                        setInterval(function(){
                            timer(item['IdDatMon']);
                        },1000);
                    }
					$('.invisible table.mon button.khachnhan').removeClass('active');
					$('.invisible table.mon tr').removeClass('disabled');

					var btn_danhan = $("table#dsmon tr[id-order='" + item['IdDatMon'] + "'] .khachnhan");  //Assign button "danhan" to variable 
                    var btn_huy = $("table#dsmon tr[id-order='" + item['IdDatMon'] + "'] .khachhuy");
                    
                    btn_danhan.click(function(){
                        if(item['TrangThai']=='0'){
                            canhbao('Đang gửi lên bếp, không thể nhận!');
                        } else if(item['TrangThai']=='1'){
                            canhbao('Bếp chưa gửi xuống, không thể nhận!');
                        } else if(item['TrangThai']=='3'){
                            canhbao('Bếp đã hủy món, không thể nhận!');
                        } else if(item['TrangThai'] == '4'){
                            canhbao('Đã nhận món!');
                        } else {
                            $('#thongbao').dialog({
								modal	: true,
								title	: 'Khách nhận món',
								open	: function(){
									var tinnhan = 'Xác nhận Khách nhận món:<br><strong class="red">'+item['TenMon']+'</strong>, số lượng: <strong class="red">'+item['SoLuong']+'</strong>';
									$(this).html(tinnhan);
								},
								buttons	: {
									'Đồng ý'  : function(){
										$.ajax({
											url		: 'update.php?khachnhanmon',
											type 	: 'POST',
											async	: false,
											data 	: {
												idDMon 		: item['IdDatMon'],
												tenBan 		: tenban
											},
											success	: function(){
												$('#'+tenban+'').trigger('click');
											}
										});
										$('#thongbao').dialog('close');
									},
									'Không' : function(){
										$('#thongbao').dialog('close');
									}
								}
							}).css('font','20px Arial');
                       }
                    });

                    btn_huy.click(function(){                   //Case : update data when click on diffirent state of food lines
                        if(item['TrangThai']=='4'){
                            canhbao('Đã nhận món, không thể hủy');
                        } else if(item['TrangThai']=='1'){
                            canhbao('Bếp đã nhận, không thể hủy');
                        } else if(item['TrangThai']=='2'){
                            canhbao('Bếp đã gửi xuống, không thể hủy!');
                        } else {
                        	$('#thongbao').dialog({
								modal	: true,
								title	: 'Hủy đặt món',
								open	: function(){
									var tinnhan = 'Xác nhận hủy đặt món:<br><strong class="red">'+item['TenMon']+'</strong>, số lượng: <strong class="red">'+item['SoLuong']+'</strong>';
									$(this).html(tinnhan);
								},
								buttons	: {
									'Đồng ý'  : function(){
										$.ajax({
											url		: 'update.php?huydatmon',
											type 	: 'POST',
											async	: false,
											data 	: {
												idDMon 	: item['IdDatMon'],
												idMon	: item['IdMon'],
												tenBan 	: tenban
											},
											success	: function(){
												$('#'+tenban+'').trigger('click');
											}
										});
										$('#thongbao').dialog('close');
									},
									'Không' : function(){
										$('#thongbao').dialog('close');
									}
								}
							}).css('font','20px Arial');
                        }
                    });
                });
                if(khachnhan == somon) khachnhan = 'daNhanHet'; else khachnhan = 'chuaNhanHet';
                $('#traban').removeClass('disabled');
                if(somon == 0) $('#traban').addClass('disabled');
            }
		});
	});
	
	//Dat mon
	$('#btndatmon').click(function(){
		var idmon = $('#mon').val();
		var slmon = $('#slmon').val();
		r =/^\d+$/;
		if (isNaN(idmon) || idmon == '' || r.test($('#CombifyInput-mon').val())) {
			$('#CombifyInput-mon').focus();
			canhbao('Tên món không hợp lệ!');
		}
		else if(isNaN(slmon) || slmon == ''){
			$('#slmon').focus();
			$('#slmon').select();
			canhbao('Số lượng món đã nhập không phải là số, vui lòng nhập lại!');
		} else {
			$('#thongbao').dialog({
				modal	: true,
				title	: 'Xác nhận đặt món!',
				open	: function(){
					var tenmon = $('option#'+idmon+'').text();
					var tinnhan = 'Xác nhận đặt món:<br><strong class="red">'+tenmon+'</strong>, số lượng: <strong class="red">'+slmon+'</strong>';
					$(this).html(tinnhan);
				},
				buttons	: {
					'OK'  : function(){
						$.ajax({
							url		: 'update.php?datmon',
							type 	: 'POST',
							async	: false,
							data 	: {
								idMon 	: idmon,
								slMon 	: slmon,
								tenBan 	: tenban
							},
							success	: function(){
								$('#'+tenban+'').trigger('click');
							}
						});
						$('#slmon').val('');
						$('#thongbao').dialog('close');
					},
					'Hủy' : function(){
						$('#thongbao').dialog('close');
					}
				}
			}).css('font','20px Arial');
		}
	});
	
	$('#traban').click(function(){
		if(khachnhan == 'chuaNhanHet'){
			canhbao('Chưa nhận hết các món, để trả bàn hãy Hủy các món chưa nhận!');
		} else {
			$('#thongbao').dialog({
				modal	: true,
				title	: 'Xác nhận trả bàn!',
				open	: function(){
					var tinnhan = 'Xác nhận trả bàn số: <strong class="red">'+tenban+'</strong>';
					$(this).html(tinnhan);
				},
				buttons	: {
					'OK'  : function(){
						$.ajax({
							url		: 'update.php?traban',
							type 	: 'POST',
							async	: false,
							data 	: {
								tenBan 	: tenban
							},
							success	: function(){
								$('#'+tenban+'').trigger('click');
							}
						});
						$('#thongbao').dialog('close');
					},
					'Hủy' : function(){
						$('#thongbao').dialog('close');
					}
				}
			}).css('font','20px Arial');
		}
	});

	//Quay lai danh sach ban
	$('#xemdsban').click(function(){
		tenban = '';
		$('.page2').fadeOut(100,function(){
			$('.page1').fadeIn(100);
		});
	});

    function refresh(){
        $.ajax({
            url         : 'connect.php?refresh',
            type        : 'GET',
            async       : false,
            dataType    : 'json',
            
            success: function(result){
                $.each(result,function(key, item){
                    $('#'+item['TenBan']+'').css('background',item['Mau']);
                    if((item['LamMoi'] == 2 || item['LamMoi'] == 3) && item['TenBan'] == tenban){
                        $('#'+tenban+'').trigger('click');
                        $.ajax({
                            url     : 'update.php?resetLamMoi',
                            type    : 'POST',
                            async   : false,
                            data    : {
                                LamMoi   : item['LamMoi'],
                                trang    : 'phucvu',
                                tenban  : item['TenBan']
                            },
                            success: function(){
                                //Do nothing
                            }
                        });
                    }
                });
            }
        });
    }
    setInterval(refresh,1000);
});