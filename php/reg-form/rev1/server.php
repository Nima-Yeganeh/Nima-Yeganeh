<?php 

$username	= "";
$email		= "";
$uname		= "";
$emailaddr	= "";
$uid		= "";
$tel		= "";
$mobile		= "";
$city		= "";
$region		= "";
$avenue		= "";
$street		= "";
$t_name		= "";
$phase		= "";
$block		= "";
$number		= "";

$errors   = array();

$db = mysqli_connect('localhost', 'avamnetw_ftth', 'P+#18XYDHBIj', 'avamnetw_ftth');

mysqli_set_charset($db, "utf8mb4");

if (isset($_POST['reg_user'])) {
	$uname			= mysqli_real_escape_string($db, $_POST['uname']);
	$emailaddr		= mysqli_real_escape_string($db, $_POST['emailaddr']);
	$uid			= mysqli_real_escape_string($db, $_POST['uid']);
	$tel			= mysqli_real_escape_string($db, $_POST['tel']);
	$mobile			= mysqli_real_escape_string($db, $_POST['mobile']);
	$city			= mysqli_real_escape_string($db, $_POST['city']);
	$region			= mysqli_real_escape_string($db, $_POST['region']);
	$avenue			= mysqli_real_escape_string($db, $_POST['avenue']);
	$street			= mysqli_real_escape_string($db, $_POST['street']);
	$t_name			= mysqli_real_escape_string($db, $_POST['t_name']);
	$phase			= mysqli_real_escape_string($db, $_POST['phase']);
	$block			= mysqli_real_escape_string($db, $_POST['block']);
	$number			= mysqli_real_escape_string($db, $_POST['number']);
	
	// $fileupload1	= mysqli_real_escape_string($db, $_POST['fileupload1']);
	if (empty($uname)) { 
		array_push($errors, "-Name is required");
	}
	// echo "Total error: " . count($errors);

  $target_dir = "xyzuploads/";
  $target_file = $target_dir . basename($_FILES["fileupload1"]["name"]);
  $uploadOk = 1;
  $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
  $target_file = $target_dir . 'test.png';
  $target_file = $target_dir . 'testi.' . $imageFileType;
  $newfilename1 = round(microtime(true)*1000);
  $newfilename2 = rand(1001,9999);
  $newfilename = $newfilename1 . $newfilename2 . '.' . $imageFileType;
  $target_file = $target_dir . $newfilename;
  // Check if image file is a actual image or fake image
  if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileupload1"]["tmp_name"]);
    if($check !== false) {
      $uploadOk = 1;
    } else {
      $uploadOk = 0;
    }
  }
  // Check if file already exists
  if (file_exists($target_file)) {
    $uploadOk = 0;
  }
  // Check file size
  if ($_FILES["fileupload1"]["size"] > 20000000) {
    $uploadOk = 0;
  }
  // Allow certain file formats
  if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
  && $imageFileType != "gif" ) {
    $uploadOk = 0;
  }
  // Check if $uploadOk is set to 0 by an error
  if ($uploadOk == 0) {
    $uploaddone = 0;
    $newfilename = '';
  // if everything is ok, try to upload file
  } else {
    if (move_uploaded_file($_FILES["fileupload1"]["tmp_name"], $target_file)) {
      $uploaddone = 1;
    } else {
      $uploaddone = 0;
      $newfilename = '';
    }
  }
	// Insert New Data
	if (count($errors) == 0) {
		$query = "INSERT INTO users (uname, emailaddr, uid, tel, mobile, fileupload1, city, region, avenue, street, t_name, phase, block, number) VALUES ('$uname', '$emailaddr', '$uid', '$tel', '$mobile', '$newfilename', '$city', '$region', '$avenue', '$street', '$t_name', '$phase', '$block', '$number')";
		mysqli_query($db, $query);
		// $_SESSION['username'] = $username;
		// $_SESSION['success']  = "You're now logged in";
		header('location: register.php');
	} else {
    header('location: index.php');
  }
}
if (isset($_POST['new_form'])) {
  header('location: index.php');
}
?>
