<?php

	$serverName = "arc353.encs.concordia.ca";
	$userName = "arc353_1";
	$password = "***REMOVED***";
	$dbName = "arc353_1";

	$con = new mysqli($serverName, $userName, $password, $dbName);
	if (!$con)
	{
	  die('Could not connect: ' . mysql_error());
	}
/*
	$query = 'select * from Students1';
	//Get Result
  $result = mysqli_query($con, $query);

  if (!$result) {
      printf("Error: %s\n", mysqli_error($con));
      exit();
  }

	//Fetch Data
	$posts = mysqli_fetch_all($result, MYSQLI_ASSOC);

	var_dump($posts);
*/
?>
