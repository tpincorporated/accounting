<?php
    include('../config/connection.php');
    include("../config/checkurlaccess.php");
    include('../config/dashboard-functions.php');

?>
<div class='header-page' >
	<div class='header-page-inner'>
		Dashboard
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent no-border">

    	<div class='col-md-9'>
    		<div class='row'>


    			
		    	
		    	
				
			

			</div>
		</div>

		<div class='col-md-3'>
			<div class='row'>
				<div class='wells'>
					<br><br><br>
				</div>
			</div>
		</div>
    

	</div>  
</div>


<script type="text/javascript">
	/**** INITIALIZED *******/
	$(document).ready(function(){
			var dashpane = '#dashtabpane';
			$(dashpane+' .datepicker').datepicker();


			

			

	});
	



</script>