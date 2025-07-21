<?php
include 'db_connect.php';
$id=$_POST['id'];
$remarks=$_POST['remarks'];
$image=$_POST['image'];
$sql="update complaints_action set remarks='$remarks',image='$image', status=3 where complaint_id = $id";
$sql1="update complaints set status=3 where id = $id";
$r1=mysqli_query($conn,$sql1);
$r=mysqli_query($conn,$sql);
echo $sql;
if($r > 0)
{
	echo "pass";
	header("Location:index.php?page=complaints");
}
else
{
	echo "Failed";
		header("Location:index.php?page=complaints");
}
?>