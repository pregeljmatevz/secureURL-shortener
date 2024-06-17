<?php
require_once(realpath(dirname(__FILE__) . '/config.php'));
$url = isset($_GET['url']) ? $_GET['url'] : '';
$db = new Connect;
$getLongURL = $db -> prepare('SELECT long_url FROM shortened_urls WHERE short_url = :short_url');
$getLongURL -> execute([
    'short_url' => $url
]);
$num = $getLongURL->fetchAll(PDO::FETCH_COLUMN);
if(count($num) != 0){
    header("Location: " . $num[0]);
}else{
    echo "This URL doen't exist!";
}
?>