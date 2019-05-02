<?php
	include('../../../config/connection.php');
	include('../../../config/functions.php');





	// Return JSON data
	$data = array();
	$data['page'] = 1;
	$data['total'] = 4;
	$data['rows'] = array();

		
	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "1",
													 "01-0640000",
													 "Creditable Withholding Tax - 5%",
													 '22,224.7800',
													 '',
													 '',
													 ''

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "2",
													 '',
													 '',
													 '',
													 "01-0110000",
													 "Accounts Receivable - Customer",
													 '22,224.7800'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);


	
			

	echo json_encode($data);
?>