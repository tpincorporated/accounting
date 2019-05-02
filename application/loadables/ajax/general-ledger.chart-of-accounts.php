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
													 "01-0010100",
													 "Cash",
													 'Detail',
													 '',
													 '(100,234,343.45)'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0011000",
													 "Petty Cash Fund",
													 'Detail',
													 '',
													 '100,000.00'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0012000",
													 "Vale Cash Fund",
													 'Detail',
													 '',
													 '200,000.00'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0012000",
													 "Cash in Bank - Metro Bank",
													 'Detail',
													 '',
													 '(64,704,234.00)'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0013000",
													 "Cash in Bank - BPI",
													 'Detail',
													 '',
													 '(23,438,100.73)'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0014000",
													 "Cash in Bank - Landbank",
													 'Detail',
													 '',
													 '(1,200,145.73)'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0015000",
													 "Cash in Bank - Allied Bank",
													 'Detail',
													 '',
													 '0.00'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0016000",
													 "Short Term Investment",
													 'Detail',
													 '',
													 '2,511,624.32'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0017000",
													 "Accounts Receivable - Customers",
													 'Detail',
													 '',
													 '44,189,280.32'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0018000",
													 "Retention Receivable",
													 'Detail',
													 '',
													 '28,200,834.32'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<img src='../resources/flexigrid/images/edit.png' title='Edit' height='20px'>",
													 "01-0019000",
													 "Loans Receivable",
													 'Detail',
													 '',
													 '0.00'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);
			

	echo json_encode($data);
?>