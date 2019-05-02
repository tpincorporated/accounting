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
													 "<input type='checkbox'>",
													 "<input type='checkbox'>",
													 '2017',
													 'Josie C. San',
													 '01/23/2017 05:34 PM'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<input type='checkbox'>",
													 "<input type='checkbox'>",
													 '2018',
													 'Marlon Sibayan',
													 '02/03/2017 01:20 PM'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<input type='checkbox'>",
													 "<input type='checkbox'>",
													 '2019',
													 'Roselyn Domile',
													 '01/03/2017 01:20 PM'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);

	$data['rows'][] = array(
									'id' => '',
									'cell' => array(
													 "<input type='checkbox'>",
													 "<input type='checkbox'>",
													 '2020',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);
			

	echo json_encode($data);
?>