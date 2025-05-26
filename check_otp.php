<?php
$email_id=$_POST['email_id'];
$gen_otp=$_POST['gen_code'];
$otp=$_POST['otp'];

if($gen_otp==$otp)
{

?>
<style>
/* CSS styles for the heading and form */
h3 {
    font-size: 1.5em; /* Example font size */
    color: #333; /* Example color */
    margin-bottom: 10px; /* Example margin */
}

form {
    /* Example form styling */
    margin-top: 20px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

input[type=password] {
    /* Example input field styling */
    width: 200px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

input[type=submit] {
    /* Example submit button styling */
    background-color: #4CAF50;
    color: white;
    padding: 8px 12px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}
</style>

<h3>Reset Your Password</h3>
<form action="reset_password.php" method="post">
<input type="hidden" value="<?php echo $email_id; ?>" name="email_id">
Reset Your Password : <input type="password" name="password" id="password">
<br>
<input type="submit" name="b1" value="Submit"> 
</form>
<?php

}
else
{
?>
<script>
alert("OTP Did Not Mached...");
history.back();
</script>
<?php
}
?>