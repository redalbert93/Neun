<?php

class connection {
	public $instance = false;
	public $connected = true;
	public $error = false;

	function __construct($error, $instance) { 
      if ($error) {
      	$this->connected = false;
      	$this->error = $error;
      } else $this->instance = $instance;
  } 
}


class connector { 
	private $config;
	public function __construct() {
     $this->config = parse_ini_file('configuration.ini', true);
  }

  public function connect() { 
    $a = new mysqli(
    	$this->config['database']['servername'], 
    	$this->config['database']['username'], 
    	$this->config['database']['password']);

    mysqli_select_db($a,$this->config['database']['dbname']);
    mysqli_set_charset($a, "utf8");
    if ($a->connect_error) 
    	return new connection($a->connect_error);
		else return new connection(false, $a);
  } 

} 

// Create connection
$connector = new connector();
$connection = $connector->connect();
$GLOBALS['$connection'] = $connection;

?>