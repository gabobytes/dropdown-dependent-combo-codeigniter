<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_states extends CI_Model {

	function getStates($country)
	{
		$this->db->select("id,namestate");
		$this->db->where("idcountry",$country);
		$this->db->order_by("namestate","ASC");
		$query = $this->db->get('states');

		return $query->result();
	}

}

/* End of file model_states.php */
/* Location: ./application/models/model_states.php */