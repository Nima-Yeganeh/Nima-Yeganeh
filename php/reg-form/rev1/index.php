<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
	<title>Registration System</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="header">
		<h2>FTTH Register - Fiber Internet Service</h2>
	</div>
	<form method="post" action="server.php" enctype="multipart/form-data">
		<div class="input-group">
			<label>Name | نام و نام خانوادگی</label>
			<input type="text" name="uname" id="uname">
		</div>
		<div class="input-group">
			<label>Email | آدرس ایمیل</label>
			<input type="email" name="emailaddr" value="<?php echo $emailaddr; ?>">
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
			<label>City | شهر</label>
			<input type="text" name="city" value="<?php echo $city; ?>">
		</div>
		<div class="input-group">
			<label>Region | نام منطقه یا محله</label>
			<input type="text" name="region" value="<?php echo $region; ?>">
		</div>
		<div class="input-group">
			<label>Avenue | نام خیابان</label>
			<input type="text" name="avenue" value="<?php echo $avenue; ?>">
		</div>
		<div class="input-group">
			<label>Street | نام کوچه</label>
			<input type="text" name="street" value="<?php echo $street; ?>">
		</div>
		<div class="input-group">
			<label>Tower | نام برج</label>
			<input type="text" name="t_name" value="<?php echo $t_name; ?>">
		</div>
		<div class="input-group">
			<label>Phase | شماره فاز</label>
			<input type="text" name="phase" value="<?php echo $phase; ?>">
		</div>
		<div class="input-group">
			<label>Block | شماره بلوک</label>
			<input type="text" name="block" value="<?php echo $block; ?>">
		</div>
		<div class="input-group">
			<label>Number | شماره واحد یا پلاک</label>
			<input type="text" name="number" value="<?php echo $number; ?>">
		</div>
		
		<div class="input-group">
			<button type="submit" class="btn" name="reg_user">Register | ثبت</button>
		</div>
		<p>
			Please complete the registration form | لطفا فرم را جهت بررسی و امکان سنجی ارائه سرویس اینترنتی کامل کنید و بر روی دکمه ثبت کلیک نمایید
		</p>
		<div class="input-group">
			<button type="submit" class="btn" name="new_form">New Form | ثبت نام جدید</button>
		</div>
	</form>
</body>
</html>
