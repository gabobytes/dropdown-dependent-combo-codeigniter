<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
 	Controller to dropdown list demo
*/

class Demo extends CI_Controller {

public function __construct()
{
	parent::__construct();
	$this->load->model('model_countries');
	$this->load->model('model_states');
	$this->load->model('model_cities');
}	

	public function index()
	{

		$data['countries'] = $this->model_countries->getCountries();
		$this->load->view('demo/demo_view',$data);
	}

	public function getStates()
	{
		$idcountry = $this->uri->segment(3);

		$data['states'] = $this->model_states->getStates($idcountry);


		//this is not a good practice, never print on a controller
		echo "<option></option>";

		foreach($data['states'] as $s):
			echo "<option value='$s->id'>".ucwords($s->namestate)."</option>";
		endforeach;
	}

	public function getCities()
	{
		$idstate = $this->uri->segment(3);

		$data['cities'] = $this->model_cities->getCities($idstate);

		//this is not a good practice, never print on a controller
		echo "<option></option>";

		foreach($data['cities'] as $s):
			echo "<option value='$s->id'>".ucwords($s->namecity)."</option>";
		endforeach;
	}



}

/* End of file demo.php */
/* Location: ./application/controllers/demo.php */