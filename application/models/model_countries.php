<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_countries extends CI_Model {

	function getCountries()
	{
		$this->db->select('id,namecountry');
		$this->db->order_by("namecountry","ASC");
		$query = $this->db->get('countries');

		return $query->result();
	}

}

/* End of file model_countries.php */
/* Location: ./application/models/model_countries.php */