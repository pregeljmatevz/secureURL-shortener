<?php
require_once('core/url.Class.php');
$URLShortener = new URLShortener;

// Function to get IP address
function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
       $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

$ipaddress = get_client_ip(); 
$apikey = "MjM5MDA6amlkZVJaMHBWV3N3c2FMdjhER3Z6Y1Z2N2U2NWtsemQ="; 

$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => "http://v2.api.iphub.info/ip/".$ipaddress,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_CUSTOMREQUEST => "GET",
    CURLOPT_HTTPHEADER => array(
        "x-key: ".$apikey
    ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
    echo "cURL Error :" . $err;
    $block = null;
} else {
    $response = json_decode($response, true); 
    $block = $response['block'] == 1;
}

$vpn_proxy_status = $block ? "Using VPN or Proxy." : "Not using VPN or Proxy.";

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, 'https://ipgeolocation.abstractapi.com/v1/?api_key=98edae86def84baf937ac9ab10db983b&ip_address=');

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);

$data = curl_exec($ch);

curl_close($ch);

$response = json_decode($data, true);

if ($response === null) {
    echo "Failed to decode JSON response.";
    exit;
}

$con = mysqli_connect("localhost", "root", "", "url_shortener");

if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit;
}
$eu_country_codes = array("AT", "BE", "BG", "CY", "CZ", "DE", "DK", "EE", "ES", "FI", "FR", "GR", "HR", "HU", "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PL", "PT", "RO", "SE", "SI", "SK");
$country_code = $response['country_code'];
if (!in_array($country_code, $eu_country_codes)) {
    exit("Access denied. Only EU countries are allowed to access this website.");
}
$is_eu = in_array($country_code, $eu_country_codes);

$sql = "INSERT INTO ip_data (ip_address, city, city_geoname_id, region, region_iso_code, region_geoname_id, postal_code, country, country_code, country_geoname_id, country_is_eu, continent, continent_code, continent_geoname_id, longitude, latitude, is_vpn, timezone_name, timezone_abbreviation, timezone_gmt_offset, timezone_current_time, timezone_is_dst, flag_emoji, flag_unicode, flag_png, flag_svg, currency_name, currency_code, connection_autonomous_system_number, connection_autonomous_system_organization, connection_type, connection_isp_name, connection_organization_name) 
VALUES (
    '{$response['ip_address']}',
    '{$response['city']}',
    '{$response['city_geoname_id']}',
    '{$response['region']}',
    '{$response['region_iso_code']}',
    '{$response['region_geoname_id']}',
    '{$response['postal_code']}',
    '{$response['country']}',
    '{$response['country_code']}',
    '{$response['country_geoname_id']}',
    '{$response['country_is_eu']}',
    '{$response['continent']}',
    '{$response['continent_code']}',
    '{$response['continent_geoname_id']}',
    '{$response['longitude']}',
    '{$response['latitude']}',
    '{$block}',
    '{$response['timezone']['name']}',
    '{$response['timezone']['abbreviation']}',
    '{$response['timezone']['gmt_offset']}',
    '{$response['timezone']['current_time']}',
    '{$response['timezone']['is_dst']}',
    '{$response['flag']['emoji']}',
    '{$response['flag']['unicode']}',
    '{$response['flag']['png']}',
    '{$response['flag']['svg']}',
    '{$response['currency']['currency_name']}',
    '{$response['currency']['currency_code']}',
    '{$response['connection']['autonomous_system_number']}',
    '{$response['connection']['autonomous_system_organization']}',
    '{$response['connection']['connection_type']}',
    '{$response['connection']['isp_name']}',
    '{$response['connection']['organization_name']}'
)";


if (!mysqli_query($con, $sql)) {
    echo "Error: " . mysqli_error($con);
    exit;
} else {
    echo "Data inserted successfully!";
}

mysqli_close($con);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>URL Shortener</title>
    <link rel='stylesheet' href='css/style.css' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>

<body>
<?php
echo $URLShortener->mainForm();
?>

<div><?php echo $vpn_proxy_status; ?></div>

</body>
</html>