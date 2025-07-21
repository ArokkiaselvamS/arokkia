<?php
$_SESSION['system']['name']="CRIME REPORT MANAGEMENT";
$statuss = array("","Pending","Received","Action Made"); 
include 'admin/db_connect.php';
 include('header.php');
$id=$_GET['id'];
$q1="select *from complaints where id='$id'";
$r1=mysqli_query($conn,$q1);
while($row1=mysqli_fetch_array($r1))
{
	$complainant=$row1['complainant_id'];
//	echo $complainant;
	$q2="select *from complainants where id='$complainant'";
	$r2=mysqli_query($conn,$q2);
	while($row2=mysqli_fetch_array($r2))
	{
		$name=$row2['name'];
		$address=$row2['address'];
		$contact=$row2['contact'];
		$email=$row2['email'];
		$aadhar=$row2['aadhar'];
	}	
	$message=$row1['message'];
	$caddress=$row1['address'];
	$cdate=$row1['date_created'];
	$image=$row1['image'];
	$status=$row1['status'];
	$sta=$statuss[$row1['status']];
}
$q3="select *from complaints_action where complaint_id='$id'";
$r3=mysqli_query($conn,$q3);
while($row3=mysqli_fetch_array($r3))
{
	$remarks=$row3['remarks'];
	$ccdate=$row3['date_created'];
	$aimage=$row3['image'];
	$rid=$row3['responder_id'];
	$q4="SELECT * FROM `responders_team` where id='$rid'";
	$r4=mysqli_query($conn,$q4);
	while($row4=mysqli_fetch_array($r4))
	{
		$responder=$row4['name'];
	}
}
?>

<center>
<h2>COMPLAINANT REPORT</h2>
</center>
<div class="container" style="padding-left=100px;border: 3px solid black;">
<h3>Complainant Details</h3>
Name :<?php echo $name ?><br><br>
Email :<?php echo $email ?><br><br>
Aadhar :<?php echo $aadhar ?><br><br>
Address:<?php echo $address ?><br><br>
</div>
<br><br><br>
<div class="container" style="padding-left=100px;border: 3px solid black;">
<h3>Complaint Details</h3>
Complaint/Report :<?php echo $message ?><br><br>
Adress :<?php echo $caddress ?><br><br>
Date :<?php echo $cdate ?><br><br>
status:<h3><?php echo $sta ?></h3><br><br>
Spot Image:<img src="admin/images/<?php echo $image?> " width="500px"><br><br>
</div>
<br><br><br><br>



<?php
if($status== 3)
{
?>

<div class="container" style="padding-left=100px;border: 3px solid black;">
<h3>Action Made</h3>
Responder Team:<?php 
echo $responder; 

?><br><br>

Remarks :<?php echo $remarks ?><br><br>
Date :<?php echo $ccdate ?><br><br>
status:<?php echo $sta ?><br><br>
Accuest Image:<img src="admin/images/<?php echo $aimage?> " width="500px">

</div>
<?php
}
?>
<br><br><br>

<center> <button onclick="window.print()">Print</button> </center>
<br><br><br>