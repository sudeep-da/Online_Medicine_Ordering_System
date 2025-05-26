<?php
include("dbconfig.php");
$email_id=$_POST['email_id'];



$query=mysqli_query($con,"SELECT * FROM customer_list WHERE email='$email_id'");
if($row=mysqli_fetch_array($query))
{

//$email_id=$row1['user_name'];
$gen_code=rand(1000,9999);

//$use_rname=$row1['user_name'];
//$password=$row1['password'];


require 'PHPMailer/PHPMailerAutoload.php';

$mail = new PHPMailer;

//$mail->SMTPDebug = 3;                               // Enable verbose debug output

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'vtechprojectmail@gmail.com';                 // SMTP username
$mail->Password = 'ttnftyfthdlaoohy';                           // SMTP password
$mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 465;                                    // TCP port to connect to

$mail->setFrom('vtechprojectmail@gmail.com', 'Mailer');
 $mail->addAddress($email_id, 'FORGOT PASSWORD');     // Add a recipient
//$mail->addAddress('ellen@example.com');               // Name is optional
//$mail->addReplyTo('info@example.com', 'Information');
//$mail->addCC('cc@example.com');
//$mail->addBCC('bcc@example.com');

//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = 'Forgot Password ';
$mail->Body    = '<div style="background-color:#FFFF99; font-size:26px;" align="center">Your Verification Code Is '.$gen_code.'</b></div>';
$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

if(!$mail->send()) {
   echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    //echo 'Message has been sent';
	?>
	<style>
    /* Form container */
    .otp-form {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
    }

    /* Text input field */
    .otp-form input[type=text] {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }

    /* Submit button */
    .otp-form input[type=submit] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    /* Center align text within form */
    .otp-form label {
        display: block;
        margin-bottom: 8px;
    }
</style>

<div class="otp-form">
    <form action="check_otp.php" method="post">
        <input type="hidden" value="<?php echo $email_id; ?>" name="email_id">
        <input type="hidden" value="<?php echo $gen_code; ?>" name="gen_code">
        <label for="otp">Enter Verification OTP:</label>
        <input type="text" name="otp" id="otp">
        <br>
        <input type="submit" name="b1" value="Submit">
    </form>
</div>

	
	<?php
}

?>

<script>
alert('Your Verification Code Sent To Your Email Address');
//document.location="login.php";
</script>
<?php
}
else
{
?>

<script>
alert('Email Address Invalid');
history.back();
</script>
<?php

}
?>