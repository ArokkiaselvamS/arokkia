<?php include 'db_connect.php' ?>
<?php
	$qry = $conn->query("SELECT * FROM complaints where id = {$_GET['id']} ");
	foreach($qry->fetch_array() as $k => $v){
		$$k = $v;
	}
	if($status > 1){
		$aqry =  $conn->query("SELECT * FROM complaints_action where complaint_id = {$_GET['id']} ");
		foreach($aqry->fetch_array() as $k => $v){
		$ca[$k] = $v;
	}
	}
?>
<div class="container-fluid">
	<div class="col-lg-12">
		<large><b>Report/Complaint:</b></large>
		<p><?php echo $message ?></p>
		<hr>
		<large><b>Incident Address:</b></large>
		<p><?php echo $address ?></p>
		<hr>
		<form action="complaint_act.php" method="POST">
			<div id="msg"></div>
			<input type="hidden" name="id" value="<?php echo $_GET['id'] ?>">
			<div class="action_made" >
				<div class="form-group">
					<label for="" class="control-label">Remarks</label>
					<textarea name="remarks" id="remarks" cols="30" rows="4" class="form-control"><?php echo isset($ca['remarks']) ? $ca['remarks'] : '' ?></textarea>
				</div>
				<div class="form-group">
					<label for="" class="control-label">Accuest Image</label>
					<input type="file" name="image" id="image" class="form-control">
				</div>
			</div>
			<input type="Submit" name="submit" value="submit" >
		</form>
<noscript>
	<style>
		table#report-list{
			width:100%;
			border-collapse:collapse
		}
		table#report-list td,table#report-list th{
			border:1px solid
		}
        p{
            margin:unset;
        }
		.text-center{
			text-align:center
		}
	</style>
</noscript>
<script>
$('#month').change(function(){
    location.replace('index.php?page=complaints_report&month='+$(this).val())
})
$('#print').click(function(){
		var _c = $('#report-list').clone();
		var ns = $('noscript').clone();
            ns.append(_c)
		var nw = window.open('','_blank','width=900,height=600')
		nw.document.write('<p class="text-center"><b>Reports as of <?php echo date("F, Y",strtotime($month)) ?></b></p>')
		nw.document.write(ns.html())
		nw.document.close()
		nw.print()
		setTimeout(() => {
			nw.close()
		}, 500);
	})
</script>