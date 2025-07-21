<?php include 'db_connect.php' ?>
<?php  include 'count.php' ?>
<style>
   span.float-right.summary_icon {
    font-size: 3rem;
    position: absolute;
    right: 1rem;
    top: 0;
}
.imgs{
		margin: .5em;
		max-width: calc(100%);
		max-height: calc(100%);
	}
	.imgs img{
		max-width: calc(100%);
		max-height: calc(100%);
		cursor: pointer;
	}
	#imagesCarousel,#imagesCarousel .carousel-inner,#imagesCarousel .carousel-item{
		height: 60vh !important;background: black;
	}
	#imagesCarousel .carousel-item.active{
		display: flex !important;
	}
	#imagesCarousel .carousel-item-next{
		display: flex !important;
	}
	#imagesCarousel .carousel-item img{
		margin: auto;
	}
	#imagesCarousel img{
		width: auto!important;
		height: auto!important;
		max-height: calc(100%)!important;
		max-width: calc(100%)!important;
	}
	
</style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
  </style>

<div class="containe-fluid">
	<div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <?php echo "Welcome back ". $_SESSION['login_name']."!"  ?>
                    <hr>
                </div>
            </div>      			
        </div>
    </div>
	<br>
	  <div class="row content">
    
    <br>
    
    <div class="col-sm-12" style="padding-left:40px;">
      <div class="well"  style="background-color:#80dfff">
        <h4>Dashboard</h4>
        <p>Crime Reporting Manager is a Completely Web Based Application which is applies to all police stations across
the country. Nowadays, Crimes are happened over the world, and it is in maximum case. Crime report
Management System is available offline as well as online with the active participation of the citizen. The main
purpose of crime reporting manager is to reduce the cases of crime. The project specially moves towards crime
detection and prevention. This study is help to provide an investigation of crime and provide effective and
efficient approaches to the investigation. The development of software includes the process of planning,
requirement analysis, system analysis and deployment and maintenance Crime Reporting Manager would
really help the complainant and the authority to communicate privately.</p>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
            <h4>COMPLAINANTS</h4>
            <p><?php echo $complainants ?></p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>COMPLAINTS</h4>
            <p><?php echo $complaints ?></p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>Responder Teams</h4>
            <p><?php echo $rt ?></p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>Solved Cases</h4>
            <p><?php echo $solved ?></p> 
          </div>
        </div>
      </div>
      
    </div>
  </div>
</div>
<script>
	$('#manage-records').submit(function(e){
        e.preventDefault()
        start_load()
        $.ajax({
            url:'ajax.php?action=save_track',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success:function(resp){
                resp=JSON.parse(resp)
                if(resp.status==1){
                    alert_toast("Data successfully saved",'success')
                    setTimeout(function(){
                        location.reload()
                    },800)

                }
                
            }
        })
    })
    $('#tracking_id').on('keypress',function(e){
        if(e.which == 13){
            get_person()
        }
    })
    $('#check').on('click',function(e){
            get_person()
    })
    function get_person(){
            start_load()
        $.ajax({
                url:'ajax.php?action=get_pdetails',
                method:"POST",
                data:{tracking_id : $('#tracking_id').val()},
                success:function(resp){
                    if(resp){
                        resp = JSON.parse(resp)
                        if(resp.status == 1){
                            $('#name').html(resp.name)
                            $('#address').html(resp.address)
                            $('[name="person_id"]').val(resp.id)
                            $('#details').show()
                            end_load()

                        }else if(resp.status == 2){
                            alert_toast("Unknow tracking id.",'danger');
                            end_load();
                        }
                    }
                }
            })
    }
</script>