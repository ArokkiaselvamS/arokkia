<?php
include 'db_connect.php';
$q1="select *from complainants";
$r1=mysqli_query($conn,$q1);
$complainants=mysqli_num_rows($r1);


$q2="select *from complaints";
$r2=mysqli_query($conn,$q2);
$complaints=mysqli_num_rows($r2);


$q3="SELECT * FROM `responders_team`";
$r3=mysqli_query($conn,$q3);
$rt=mysqli_num_rows($r3);

$q4="SELECT * FROM complaints where status=3";
$r4=mysqli_query($conn,$q4);
$solved=mysqli_num_rows($r4);

?>