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
													 "Accounts Payable - Suppliers",
													 "02-0100000",
													 'Accounts Payable - Suppliers'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "Accounts Receivable - Customers",
													 "01-0110000",
													 'Accounts Receivable - Customers'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "AP - Clearing",
													 "02-0110000",
													 'AP - Clearing'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "AR - Clearing",
													 "01-0620000",
													 'AR - Clearing'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "Cash Account",
													 "01-0110000",
													 'Accounts Receivable - Customers'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "Cost of Sales",
													 "06-0590000",
													 'Trading - Cost of Sales'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "Customer Deposit",
													 "02-0140000",
													 'Advances from Customers'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "Deposit to Supplier",
													 "01-0190000",
													 'Advances to Suppliers'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "Input EVAT",
													 "01-0640000",
													 'Creditable Withholding Tax - 5% VAT'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "Input EWT",
													 "01-0630000",
													 'Creditable Withholding Tax - Expanded'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "Input VAT",
													 "01-0610000",
													 'Creditable Input VAT'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	
			

	echo json_encode($data);
?>