<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Test jQuery Confirm Dialog</title>
  <script src="js/jquery-1.7.2.min.js"></script>
  <script src="plugin/jquery-ui/jquery-ui.js"></script>
  <link rel="stylesheet" href="plugin/jquery-ui/jquery-ui.css">
  <script>
  $(document).ready(function(){
		$("#deletebutton").click(function() {
		    $('#dialog-confirm').dialog('open');
		});

		// jquery-ui confirm dialog box
		$("#dialog-confirm").dialog({
		   autoOpen: true,
		   resizable: true,
		   modal: true,
		   buttons: {
		        'Remove': function() { // remove what you want to remove
		               // do something here
		         },
		         'Cancel': function() {
		               $(this).dialog('close');
		         }
		   }
		});
	});
  </script>
</head>
<body>
<div id="dialog-confirm" title="Remove this?">
    <p align="justify"> 
         <span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
         This will be permanently deleted in our system and cannot be recovered. Do you want to continue?
    </p>
</div>
<button id="deletebutton">Delete</button>
</body>
</html>