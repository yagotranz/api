<?php


// Set the error handling
ini_set('display_errors', 1);
error_reporting(-1);





require 'vendor/autoload.php';
$app = new Silex\Application();
$app['debug'] = true;
$app->error(function(\Exception $e) use ($app) {
    print $e->getMessage(); // Do something with $e
});

include 'bootstrap.php';
include 'connection.php';

use Todos\Models\Message;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Todos\Middleware\Logging as TodoLogging;
use Todos\Middleware\Authentication as TodoAuth;
use Todos\Models\User;

$app->before(function($request, $app) {
			
        TodoLogging::log($request, $app);
        TodoAuth::authenticate_custom($request, $app);
});



$app->get('/message', function(Request $request) {
      


$message = Message::where('user_id', $request->attributes->get('userid'))->get();

$payload = array();
foreach ($message as $msg){
$payload[] =
       [
                'body' => $msg->body,
                'user_id' => $msg->user_id,
                'created_at' => $msg->created_at,
						'done' => $msg->done
        ];
 }

	$payload1 = [
				'messages' => $payload	
	];
  return json_encode($payload1, JSON_UNESCAPED_SLASHES);
});


$app->get('/message', function(Request $request) {
      


$message = Message::where('user_id', $request->attributes->get('userid'))->get();

$payload = array();
foreach ($message as $msg){
$payload[] =
       [
                'body' => $msg->body,
                'user_id' => $msg->user_id,
                'created_at' => $msg->created_at,
						'done' => $msg->done
        ];
 }

	$payload1 = [
				'messages' => $payload	
	];
  return json_encode($payload1, JSON_UNESCAPED_SLASHES);
});

$app->get('/message/{message_id}', function($message_id) use ($app) {
   // $_message = $request->get('message');
    $message = Message::where('id', $message_id)->get();
    //$message = new Message();

    $payload = [];
foreach ($message as $msg){
        $payload =
        [
                'body' => $msg->body,
                'user_id' => $msg->user_id,
                'created_at' => $msg->created_at,
                'done' => $msg->done
        ];
 }
  return json_encode($payload, JSON_UNESCAPED_SLASHES);
});

$app->post('/message', function(Request $request) use ($app) {
    $_message = $request->get('message');
    $message = new Message();
    $message->body = $_message;
    $message->user_id = $request->attributes->get('userid');
    $message->save();

    if ($message->id) {
        $payload = ['message_id' => $message->id, 'message_uri' => '/messages/' . $message->id];
        $code = 201;
    } else {
        $code = 400;
        $payload = [];
    }

    return $app->json($payload, $code);
});

$app->put('/message/{message_id}', function($message_id, Request $request) use ($app) {
    $_message = $request->get('message');
    $message = Message::find($message_id);
    $message->body = $_message;

  
   
    $message->save();

    if ($message->id) {
        $payload = ['message_id' => $message->id, 'message_uri' => '/messages/' . $message->id];
        $code = 201;
    } else {
        $code = 400;
        $payload = [];
    }

    return $app->json($payload, $code);
});
$app->delete('/message/{message_id}', function($message_id) use ($app) {
    $message = Message::find($message_id);
    $message->delete();

    if ($message->exists) {
        return new Response('', 400);
    } else {
        return new Response('Your message is deleted', 204);
    }
});


$app->run();


?>