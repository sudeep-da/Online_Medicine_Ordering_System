<?php

include("dbconfig.php");
$email_id=$_POST['email_id'];
$psw=$_POST['password'];
$password=md5($psw);

$query=mysqli_query($con,"UPDATE customer_list SET password='$password' where email='$email_id'");


?>
<script>
alert('Password Reset Successful');
document.location="login.php";
</script>