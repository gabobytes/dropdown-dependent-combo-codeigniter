<?php $this->load->view('masterpage/head'); ?>


 <script>
 $(document).ready(function($) {
	
 	$("#country").change(function(event) {
 		var idcountry = this.value;

 		//clear state and city before load data
 		$("#state").empty();
 		$("#city").empty();

 		//load states with get method
 		$.get('<?php echo site_url();?>demo/getStates/'+idcountry, function(data) {
 			$("#state").html(data);
 		});


 	
 	$("#state").change(function(event) {
		var idstate = this.value;

		$.get('<?php echo site_url();?>demo/getCities/'+idstate, function(data) {
			$("#city").html(data);
		});
 	});

 	});

 });//document ready
 </script>

<div class="row">
	<h1>Dropdown dependent - CI and Bootstrap</h1>	
	<div class="col-md-8">
		<div class="form-group">
		<label for="country">Country</label>
			<select name="country" id="country" class="form-control">
				<option></option>
				<?php foreach($countries as $c): ?>
					<option value="<?php echo $c->id; ?>"><?php echo ucwords($c->namecountry); ?></option>
				<?php endforeach; ?>
			</select>
		</div>

		<div class="form-group">
		<label for="state">State</label>
			<select name="state" id="state" class="form-control">
				<option></option>				
			</select>
		</div>

		<div class="form-group">
		<label for="city">City</label>
			<select name="city" id="city" class="form-control">
				<option></option>				
			</select>
		</div>				
	</div>
</div>


<?php $this->load->view('masterpage/footer'); ?>
