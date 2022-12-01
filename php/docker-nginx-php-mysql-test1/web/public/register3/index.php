<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
	<title>Registration System</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="header">
		<h2>FTTH Register - Fiber Internet</h2>
	</div>

	<form method="post" action="index.php">
		<?php include('errors.php') ?>
		<div class="input-group">
			<label>Name | نام و نام خانوادگی</label>
			<input type="text" name="uname" value="<?php echo $uname; ?>">
		</div>
		<div class="input-group">
			<label>Email | آدرس ایمیل</label>
			<input type="email" name="emailaddr" value="<?php echo $emailaddr; ?>">
		</div>
		<div class="input-group">
			<label>ID | شناسه ملی</label>
			<input type="text" name="uid" value="<?php echo $uid; ?>">
		</div>
		<div class="input-group">
			<label>Tel | تلفن ثابت</label>
			<input type="text" name="tel" value="<?php echo $tel; ?>">
		</div>
		<div class="input-group">
			<label>Mobile | موبایل</label>
			<input type="text" name="mobile" value="<?php echo $mobile; ?>">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="reg_user">Register | ثبت</button>
		</div>
		<p>
			New Registration Form | فرم جدید >> <a href="index.php">Click Here | کلیک کنید</a>
		</p>
	</form>
</body>
</html>
