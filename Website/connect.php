<?php

	$serverName = "arc353.encs.concordia.ca";
	$userName = "arc353_1";
	$password = "raptors2";
	$dbName = "arc353_1";

	$con = new mysqli($serverName, $userName, $password, $dbName);
	if (!$con)
	{
	  die('Could not connect: ' . mysql_error());
	}

?>
