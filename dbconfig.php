<?php

$con = mysqli_connect("localhost","root","","omos_db");
	if (mysqli_connect_errno())
	{
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}
?>