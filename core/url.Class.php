<?php
require_once(realpath(dirname(__FILE__) . '/../config.php'));

class URLShortener {
    function generateShortURL($n) {
        $db = new Connect;
        $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
        $shortURL = '';
        for ($i = 0; $i < $n; $i++) {
            $index = rand(0, strlen($characters) - 1);
            $shortURL .= $characters[$index];
        }
        $checkURL = $db->prepare('SELECT id FROM shortened_urls WHERE short_url = :new_url');
        $checkURL->execute(['new_url' => $shortURL]);
        $num = $checkURL->fetchAll(PDO::FETCH_COLUMN);
        $checkExistingURL = count($num);
        if ($checkExistingURL != 0) {
            $shortURL = $shortURL . count($num);
        }
        return $shortURL;
    }

    function validate() {
        $db = new Connect;
        $long_url = isset($_POST['long_url']) ? $_POST['long_url'] : '';
        $long_url = trim($long_url);
        if (!empty($long_url)) {
            $shortURL = $this->generateShortURL(5);
            $insertData = $db->prepare('INSERT INTO shortened_urls (long_url, short_url) VALUES (:long_url, :short_url)');
            $insertData->execute([
                'long_url' => $long_url,
                'short_url' => $shortURL
            ]);
            if ($insertData) {
                $fullURL = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://" . $_SERVER['SERVER_NAME'] . '/' . $shortURL;
                $output = '<p style="text-align:center;">Here is your short URL:<br />';
                $output .= '<span id="short-url">' . $fullURL . '</span></p>';
                $output .= '<button onclick="copyToClipboard()">Copy to Clipboard</button>';
                return $output;
            }
        } else {
            return '<p style="text-align:center;">Please fill out the form!</p>';
        }
    }
    

    function mainForm() {
        $a = isset($_GET['action']) ? $_GET['action'] : '';
        return '
            <div class="form_block">
                <div id="title">
                    URL Shortener
                </div>
                <div class="body">' .
        ($a == 'validate' ? $this->validate() : '') .
        '<form action="?action=validate" method="POST">
                        <input type="text" name="long_url" placeholder="Enter URL" required />
                        <input type="submit" value="Submit" />
                    </form>
                </div>
            </div>
        ';
    }
}

// Handle copy to clipboard functionality
if (isset($_POST['copy_clipboard'])) {
    $shortURL = $_POST['short_url'];
    $command = 'echo ' . escapeshellarg($shortURL) . ' | clip';
    exec($command);
    echo '<script>alert("Short URL copied to clipboard!");</script>';
}
?>
<script>
    function copyToClipboard() {
        var copyText = document.getElementById("short-url");
        var tempInput = document.createElement("input");
        tempInput.value = copyText.textContent;
        document.body.appendChild(tempInput);
        tempInput.select();
        document.execCommand("copy");
        document.body.removeChild(tempInput);
        alert("Copied the URL: " + copyText.textContent);
    }
</script>
