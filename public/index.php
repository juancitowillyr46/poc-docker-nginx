<?php
use App\Libs\HelloWorld;
require __DIR__ . '/../vendor/autoload.php';
$hello = new HelloWorld();
echo $hello->message;
