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
													 'January',
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
													 'February',
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
													 'March',
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
													 'April',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

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
													 'May',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

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
													 'June',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

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
													 'July',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

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
													 'August',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

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
													 'September',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

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
													 'October',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

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
													 'November',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

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
													 'December',
													 'Marlon Sibayan',
													 '02/12/2017 01:20 PM'

													),
									'rowAttr'=>array(
													   'rowid'=>''
													)
								);
			

	echo json_encode($data);
?>