<?php

require 'vendor/autoload.php';

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule();

$capsule->addConnection([
"driver" => "pgsql",
"host" => "127.0.0.1",
"database" => "tranz",
"username"=>"tranz_user",
"password"=>	"tranz",
"charset" => "utf8",
"collation"=>"utf8_general_ci"
]);

$capsule->bootEloquent();

?>