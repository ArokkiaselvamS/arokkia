<?php
session_start();
$id=$_SESSION['login_id'];
include 'admin/db_connect.php';
$message=$_GET['message'];
$address=$_GET['address'];
$image=$_GET['image'];
$sql="insert into `complaints`(complainant_id,message,address,image) values('$id','$message','$address','$image')";
$r=mysqli_query($conn,$sql);
if($r > 0)
{
	echo "Success";
	header("Location:index.php");
}
else
{
	echo 'Failed';
}
?>