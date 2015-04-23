<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_cities extends CI_Model {

	function getCities($state)
	{
		$this->db->select("id,namecity");
		$this->db->where("idstate",$state);
		$this->db->order_by("namecity","ASC");
		$query = $this->db->get('cities');

		return $query->result();		
	}

}

/* End of file model_cities.php */
/* Location: ./application/models/model_cities.php */