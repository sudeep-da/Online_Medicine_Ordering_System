<?php 
if($_settings->userdata('id') == '' || $_settings->userdata('login_type') != 2){
	echo "<script>alert('You don’t have access to this page'); location.replace('./');</script>";
}
?>
<style>
.product-logo {
	width:7em;
	height:7em;
	object-fit:cover;
	object-position:center center
}
.qr-container img {
	width: 150px;
	cursor: pointer;
	transition: transform 0.3s ease;
}
.qr-container img:hover {
	transform: scale(1.05);
}
.fullscreen-qr {
	position: fixed;
	top: 0; left: 0;
	width: 100vw; height: 100vh;
	background: rgba(0,0,0,0.8);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 9999;
}
.fullscreen-qr img {
	width: 300px;
}
.upi-id {
	font-weight: bold;
	color: #333;
	margin-top: 5px;
}
</style>

<section class="py-3">
	<div class="container">
		<div class="content px-3 py-5 bg-gradient-maroon">
			<h3><b>Cart List</b></h3>
		</div>
		<div class="row mt-n4 justify-content-center align-items-center flex-column">
			<div class="col-lg-10 col-md-11 col-sm-12 col-xs-12">
				<div class="card rounded-0 shadow">
					<div class="card-body">
						<div class="container-fluid">
							<?php 
								$cart_total = $conn->query("SELECT SUM(c.quantity * p.price) FROM `cart_list` c inner join product_list p on c.product_id = p.id inner join category_list cc on p.category_id = cc.id where customer_id = '{$_settings->userdata('id')}' ")->fetch_array()[0];
								$cart_total = $cart_total > 0 ? $cart_total : 0;
							?>
							<form action="" id="order-form" enctype="multipart/form-data">
								<input type="hidden" name="total_amount" value="<?= $cart_total ?>">
								<h3><b>Total: <?= format_num($cart_total, 2) ?></b></h3>
								
								<div class="form-group">
									<label for="delivery_address" class="control-label">Delivery Address</label>
									<textarea name="delivery_address" id="delivery_address" cols="30" rows="4" class="form-control form-control-sm rounded-0" required></textarea>
								</div>

								<div class="form-group mt-2">
									<label><b>Payment Method:</b></label><br>
									<input type="radio" name="payment_method" value="cod" id="cod"> <label for="cod">Cash on Delivery</label><br>
									<input type="radio" name="payment_method" value="upi" id="upi"> <label for="upi">Pay via UPI</label>
								</div>

								<div class="qr-container text-center my-3" id="qr-section" style="display:none;">
									<label><b>Scan the QR to Pay:</b></label><br>
									<img src="Q_R.jpg" alt="QR Code" id="qrImage">
									<div class="upi-id">UPI ID: <span>8217264204@ibl</span></div>
									<div class="text-muted mt-1">Amount: ₹<?= format_num($cart_total, 2) ?></div>
								</div>

								<div class="form-group text-center" id="upi-input-section" style="display:none;">
									<label for="user_upi_id"><b>Enter your Transaction ID:</b></label>
									<input type="text" id="user_upi_id" name="user_upi_id" class="form-control form-control-sm rounded-0" placeholder="example'T2505211651313827719332'">
									<button type="button" class="btn btn-primary mt-2" id="upi-go-btn">Go</button>
								</div>

								<div class="text-center" id="paid-btn-container" style="display:none;">
									<button type="button" class="btn btn-warning" id="paid-btn">I Have Paid</button>
								</div>

								<div class="py-2 text-center">
									<button class="btn btn-lg btn-default text-light bg-gradient-maroon col-lg-4 col-md-6 col-sm-12 col-xs-12 rounded-pill mx-2" id="place-order-btn" style="display:none;">Place Order</button>
								</div>
							</form>

							<div class="fullscreen-qr" id="fullscreenQR">
								<img src="Q_R.jpg" alt="Full QR">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
$(function(){
	const qrSection = $('#qr-section');
	const upiInputSection = $('#upi-input-section');
	const paidBtnContainer = $('#paid-btn-container');
	const placeOrderBtn = $('#place-order-btn');

	qrSection.hide();
	upiInputSection.hide();
	paidBtnContainer.hide();
	placeOrderBtn.hide();

	$('input[name="payment_method"]').change(function(){
		const method = $(this).val();
		if(method === 'cod') {
			qrSection.hide();
			upiInputSection.hide();
			paidBtnContainer.hide();
			placeOrderBtn.show();
		} else if(method === 'upi') {
			qrSection.show();
			upiInputSection.show();
			paidBtnContainer.hide();
			placeOrderBtn.hide();
		} else {
			qrSection.hide();
			upiInputSection.hide();
			paidBtnContainer.hide();
			placeOrderBtn.hide();
		}
	});

	$('#upi-go-btn').click(function(){
		const userUpiId = $('#user_upi_id').val().trim();
		if(userUpiId === '') {
			alert("Please enter your UPI ID.");
			$('#user_upi_id').focus();
			return;
		}
		upiInputSection.hide();
		paidBtnContainer.show();
	});

	$('#paid-btn').click(function(){
		alert_toast("Payment successful!", 'success');
		placeOrderBtn.show();
	});

	$('#qrImage').click(function(){
		$('#fullscreenQR').fadeIn();
	});
	$('#fullscreenQR').click(function(){
		$(this).fadeOut();
	});

	$('#order-form').submit(function(e){
		e.preventDefault();
		const selectedPayment = $('input[name="payment_method"]:checked').val();
		if (!selectedPayment) {
			alert("Please select a payment method.");
			return false;
		}
		if(selectedPayment === 'upi') {
			const userUpiId = $('#user_upi_id').val().trim();
			if(userUpiId === '') {
				alert("Please enter your UPI ID before placing order.");
				$('#user_upi_id').focus();
				return false;
			}
			if(!$("input[name='user_upi_id']").length){
				$('<input>').attr({
					type: 'hidden',
					name: 'user_upi_id',
					value: userUpiId
				}).appendTo('#order-form');
			}
		}
		start_loader();
		$.ajax({
			url: _base_url_ + 'classes/Master.php?f=place_order',
			method: 'POST',
			data: new FormData(this),
			processData: false,
			contentType: false,
			dataType: 'json',
			error: err => {
				console.log(err);
				alert_toast("An error occurred.", 'error');
				end_loader();
			},
			success: function(resp){
				if(resp.status == 'success'){
					alert_toast("Order placed successfully!", 'success');
					location.replace('./');
				} else {
					alert_toast("An error occurred.", 'error');
				}
				end_loader();
			}
		});
	});
});
</script>
