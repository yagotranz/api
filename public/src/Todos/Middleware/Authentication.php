<?php

namespace Todos\Middleware;
use Todos\Models\User;

class Authentication {
public static function authenticate_custom($request, $app)
{
$auth = $request->headers->get("AuthorizationKey");

$apikey = substr($auth, strpos($auth, ' '));

$apikey = trim($apikey);

$apikey = 'd0763edaa9d9bd2a9516280e9044d885';

$user = new User();
$check = $user->authenticate($apikey);

//añadir negacion ! de check en producción
if(!$check){
$app->abort(401);
}

else $request->attributes->set('userid',$check);

}
}

?>