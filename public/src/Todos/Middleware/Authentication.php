<?php

namespace Todos\Middleware;
use Todos\Models\User;

class Authentication {
public static function authenticate_custom($request, $app)
{
$auth = $request->headers->get("AuthorizationKey");

$apikey = substr($auth, strpos($auth, ' '));

$apikey = trim($apikey);
echo $apikey;
$user = new User();
$check = $user->authenticate($apikey);

if(!$check){
$app->abort(401);
}

else $request->attributes->set('userid',$check);

}
}

?>