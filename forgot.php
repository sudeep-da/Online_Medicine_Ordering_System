
              <style>
    /* Center align the form */
    form {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
    }

    /* Style the heading */
    h2 {
        text-align: center;
        color: #333;
    }

    /* Style the text input */
    .text {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }

    /* Style the submit button */
    .btn {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        display: block;
        margin: 10px auto;
    }

    /* Hover effect on button */
    .btn:hover {
        background-color: #45a049;
    }
</style>

<h2>Forgot Password</h2>
<form action="forgo_nextt.php" method="post">
    <input type="text" class="text" name="email_id" placeholder="Email Id" required="" autofocus>
    <button class="btn" type="submit">Submit</button>
</form>
