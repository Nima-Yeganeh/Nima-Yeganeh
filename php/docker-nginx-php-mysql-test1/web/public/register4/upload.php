<?php

$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileupload1"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
$target_file = $target_dir . 'test.png';
$target_file = $target_dir . 'testi.' . $imageFileType;
$newfilename1 = round(microtime(true)*1000);
$newfilename2 = rand(1001,9999);
$newfilename = $newfilename1 . $newfilename2;
$target_file = $target_dir . $newfilename . '.' . $imageFileType;

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
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileupload1"]["tmp_name"], $target_file)) {
    $uploaddone = 1;
  } else {
    $uploaddone = 0;
  }
}

?>
