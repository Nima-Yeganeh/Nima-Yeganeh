<?php 
session_start();

$username	= "";
$email		= "";
$uname		= "";
$emailaddr	= "";
$uid		= "";
$tel		= "";
$mobile		= "";

$errors   = array();

$db = mysqli_connect('mysql', 'root', 'root', 'register4');

if (isset($_POST['reg_user'])) {

	$uname			= mysqli_real_escape_string($db, $_POST['uname']);
	$emailaddr		= mysqli_real_escape_string($db, $_POST['emailaddr']);
	$uid			= mysqli_real_escape_string($db, $_POST['uid']);
	$tel			= mysqli_real_escape_string($db, $_POST['tel']);
	$mobile			= mysqli_real_escape_string($db, $_POST['mobile']);
	$fileupload1	= mysqli_real_escape_string($db, $_POST['fileupload1']);
	
	if (empty($uname)) { 
		array_push($errors, "-Name is required");
	}

	echo "Total error: " . count($errors);

	// Insert New Data
	if (count($errors) == 0) {
		$query = "INSERT INTO users (uname, emailaddr, uid, tel, mobile, fileupload1) VALUES ('$uname', '$emailaddr', '$uid', '$tel', '$mobile', '$fileupload1')";
		mysqli_query($db, $query);
		// $_SESSION['username'] = $username;
		// $_SESSION['success']  = "You're now logged in";
		header('location: index.php');
	}

}

// Click Login
if (isset($_POST['login_user'])) {
	$username = mysqli_real_escape_string($db, $_POST['username']);
	$password = mysqli_real_escape_string($db, $_POST['password']);

	if (empty($username)) {
		array_push($errors, "Username is required");
	}

	if (empty($password)) {
		array_push($errors, "Password is required");
	}

	if (count($errors) == 0) {
		$password = md5($password);

		$query = "SELECT * FROM users WHERE username='$username' AND password='$password'";
		$results = mysqli_query($db, $query);
		if (mysqli_num_rows($results) == 1) {
			$_SESSION['username'] = $username;
			$_SESSION['success']  = "You are now logged in";
			header('location: index.php');
		} else {
			array_push($errors, "Wrong username/password combination");
		}
	}
}

?>
