// Table state after click on a line food
function tableState(tablenum){
    var lastCL = '#f6f6f6';
    $.ajax({                                 // Gets data from server to reload color of Table
        url      : 'connect.php?getColor',
        type     : 'get',
        dataType : 'json',
        async    : false,                   // to dispatch value to the ajax function
        success  : function (result){       // If get date successfully, Do the success
            $.each (result, function (key, item){
                // Sets Table having id = tablenum color lastCL
                if(tablenum == item['TenBan']){
                    $('#'+item['TenBan']+'').css('background',item['Mau']);
                    lastCL = item['Mau'];
                }
            });
        }
    });
    return lastCL;    // returns the color of Table after clicking on a line food
};

function timer(IdDatMon){
    $.ajax({
        url     : 'connect.php?tinhTG&IdDatMon='+IdDatMon,
        type    : 'GET',
        dataType: 'json',
        async   : false,
        success : function(data){
            var time = data.split(':');
            if(time[1]>=10 || time[0]>0) data='<span style="color:red">'+data+'</span>';
            $('table#menu-order tr[id-order="'+IdDatMon+'"] .thoigiandoi').html(data);
        }
    });
}

function getColor(){
    $.ajax({
        url         : 'connect.php?getColor',
        type        : 'GET',
        async       : false,
        dataType    : 'json',
        
        success: function(result){
            $.each(result,function(key, item){
                $('#'+item['TenBan']+'').css('background',item['Mau']);
                if(item['LamMoi'] == 1 && item['TenBan'] == $('.ChonBan').attr('id')){
                    $('.ChonBan').trigger('click');
                    $.ajax({
                        url     : 'update.php?resetLamMoi',
                        type    : 'POST',
                        async   : false,
                        data    : {
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
    setTimeout(getColor,1000);  // update time every 1s
}

function canhbao(tinnhan){
    $('#thongbao').dialog({
        modal   : true,
        title   : 'Chú ý!',
        open    : function(){
            $(this).html(tinnhan);
        },
        buttons : {
            'Đóng' : function(){
                $('#thongbao').dialog('close');
            }
        }
    }).css('font','20px Arial');
}

$( document ).ready(function() {                            //Specifies the function to run after the document is loaded

    getColor();
    var lastId = 0, currentId = 0, lastColor = "#f6f6f6";
    var xacnhan = false;
    $('.nutbam').click(function () {                       // Event onclick for every "nutbam" class
        var tenban = $(this).html();                       // Gets HTML from button clicked
        
        $('table#menu-order').css('display','');
        
        $('.ChonBan').removeClass("ChonBan");

        $(this).addClass("ChonBan");            // Element having currentId adds "ChonBan" class
        
        $('#tablename').html(tenban);                    // Displays name of Table button clicked to the detail table        
        
        var tieude=$('table.tieude').html();                // Get HTML form element having "tieude" class
        
        $('table#menu-order').html(tieude);
        
        $.ajax({                                           // Get data to check the food lines in each Table
            url      : 'connect.php?getOrderList',
            type     : 'get',
            async    : false,
            dataType : 'json',

            success  : function (result){
                var chayTimer = null;
                $.each (result, function (key, item){
                    if(tenban == item['TenBan']){
                        $('#menu-invisible .tenmon').html(item['TenMon']);
                        $('#menu-invisible .soluong').html(item['SoLuong']);
                        $('#menu-invisible .tong').html(item['Tong']);
                        var h = $('#menu-invisible').html();                // Gets all the HTML from element having "menu-invisible" Id   
                        // replace new id
                        h = h.replace("id-order", "id-order='" + item['IdDatMon'] + "'");
                        $('table#menu-order').append(h);                    // Appends title of detail Table
                        
                        timer(item['IdDatMon']);
                        if(item['TrangThai']!='4'){
                            setInterval(function(){
                                timer(item['IdDatMon']);
                            },1000);
                        }

                        var btn_danhan = $("table#menu-order tr[id-order='" + item['IdDatMon'] + "'] a.danhan");
                        var btn_dagui = $("table#menu-order tr[id-order='" + item['IdDatMon'] + "'] a.dagui");
                        var btn_huy = $("table#menu-order tr[id-order='" + item['IdDatMon'] + "'] a.huy");

                        switch (item['TrangThai']){                                         // Display the color of state of food lines!
                                case '1':                                                   // when clicking on Table
                                    btn_danhan.css("backgroundColor", "green");
                                    btn_dagui.css("backgroundColor", "#f6f6f6");
                                    btn_huy.css("backgroundColor", "#f6f6f6");
                                    break;
                                case '4':
                                    $('tr[id-order="'+item['IdDatMon']+'"]').addClass('ui-disabled');
                                case '2':
                                    btn_danhan.css("backgroundColor", "#f6f6f6");
                                    btn_dagui.css("backgroundColor", "green");
                                    btn_huy.css("backgroundColor", "#f6f6f6");
                                    break;

                                case '3':
                                    btn_danhan.css("backgroundColor", "#f6f6f6");
                                    btn_dagui.css("backgroundColor", "#f6f6f6");
                                    btn_huy.css("backgroundColor", "green");
                                    break;
                                default:
                                    break;
                        }
                            

                        btn_danhan.click(function(){                          // Displays state and color of food line and Table
                            xacnhan = false;
                            if($(this).css('backgroundColor')=='rgb(0, 128, 0)'){
                                canhbao('Món này đã được bếp nhận!');
                            } else{
                                var ct='Xác nhận Bếp nhận món: '+item['TenMon']+', số lượng: '+item['SoLuong']+'?';
                                $('#content2').html(ct);
                                $("#cfbtn").click(function(){
                                    if(!xacnhan){
                                        btn_danhan.css("backgroundColor", "green");
                                        var tr = btn_danhan.closest('tr');
                                        var idDM = tr.attr('id-order');        // Get the IdDatMon of datmon Table
                                        $("table#menu-order tr[id-order='" + idDM + "'] a.dagui").css("backgroundColor", "#f6f6f6");
                                        $("table#menu-order tr[id-order='" + idDM + "'] a.huy").css("backgroundColor", "#f6f6f6");
                                        $.ajax({
                                            type    : 'POST',
                                            url     : 'update.php?update=danhan',
                                            async   : false,
                                            success : function(data){
                                                lastColor = tableState(item['TenBan']);     // Updates color of Table after clicking on food lines
                                            },
                                            data    : {
                                                ten_ban    : tenban,
                                                trangthai : 1,
                                                ID_DatMon    : idDM              // Retrieves IdDatMon to update State of food lines
                                            }
                                        }); 
                                    xacnhan = true;  
                                    }
                                });
                            }
                        });

                        btn_dagui.click(function(){
                            if($(this).css('backgroundColor')=='rgb(0, 128, 0)'){
                                canhbao('Món này đã được bếp gửi!');
                            } else if(confirm('Xác nhận Bếp gửi món?')){
                                $(this).css("backgroundColor", "green");
                                var tr = $(this).closest('tr');
                                var idDM = tr.attr('id-order');        // Get the IdDatMon of datmon Table
                                $("table#menu-order tr[id-order='" + idDM + "'] a.danhan").css("backgroundColor", "#f6f6f6");
                                $("table#menu-order tr[id-order='" + idDM + "'] a.huy").css("backgroundColor", "#f6f6f6");

                                $.ajax({
                                    type    : 'POST',
                                    url     : 'update.php?update=dagui',
                                    async   : false,
                                    success : function(data){
                                        console.log(data);
                                          lastColor = tableState(item['TenBan']);
                                    },
                                    data    : {
                                        ten_ban    : tenban,
                                        trangthai : 2,
                                        ID_DatMon    : idDM
                                    }
                                });   
                            }
                        });

                        btn_huy.click(function(){                   //Case : update data when click on diffirent state of food lines
                            if($(this).css('backgroundColor')=='rgb(0, 128, 0)'){
                                canhbao('Món này đã được bếp hủy!');
                            } else if(item['TrangThai']=='4'){
                                canhbao('Khách đã nhận món, không thể hủy!');
                            } else if(confirm('Xác nhận Bếp hủy món?')){
                                $(this).css("backgroundColor", "green");
                                var tr = $(this).closest('tr');
                                var idDM = tr.attr('id-order');        // Get the IdDatMon of datmon Table
                                $("table#menu-order tr[id-order='" + idDM + "'] a.dagui").css("backgroundColor", "#f6f6f6");
                                $("table#menu-order tr[id-order='" + idDM + "'] a.danhan").css("backgroundColor", "#f6f6f6");

                                $.ajax({                              // Update data to server using type = "POST"
                                    type    : 'POST',
                                    url     : 'update.php?update=dahuy',
                                    async   : false,
                                    success : function(data){
                                        console.log(data);
                                        lastColor = tableState(item['TenBan']);
                                    },
                                    data    : {
                                        ten_ban    : tenban,
                                        trangthai : 3,                 // State of button dispatching
                                        ID_DatMon    : idDM               
                                    }
                                });
                            }
                        });
                    }
                });
            }
        });
        
        lastColor = tableState(tenban);
        if(lastColor=='#f6f6f6'){
            $('#table').css('display','none');
        } else {
            $('#table').css('display','');
        }
    
    });

});