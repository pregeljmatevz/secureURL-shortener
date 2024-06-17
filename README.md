---

# SecureURL Shortener

SecureURL Shortener is a PHP-based URL shortening service enhanced with IP geolocation and VPN/proxy detection capabilities. It utilizes APIs to gather detailed visitor information and restricts access based on geographical location within the EU. This project provides a secure and efficient way to shorten URLs while maintaining data integrity and security measures.

## Features:

- **URL Shortening:** Generates short URLs for long links entered by users.
- **IP Geolocation:** Retrieves detailed geographical data of visitors using IP address.
- **VPN/Proxy Detection:** Blocks access for visitors using VPNs or proxies.
- **EU Access Control:** Restricts access to users from EU member countries only.
- **Clipboard Copy:** Allows users to copy shortened URLs to the clipboard with a single click.

## APIs Used:

- **IPHub API:** Provides VPN/proxy detection and IP address details. [Generate API Key](https://iphub.info/login)
- **AbstractAPI Geolocation:** Retrieves geographical information based on IP address. [Generate API Key](https://app.abstractapi.com/api/ip-geolocation/settings)

## Technologies:

- **PHP:** Backend scripting language for server-side operations.
- **MySQL:** Database management system for storing URL mappings and visitor data.
- **HTML/CSS/JavaScript:** Frontend technologies for user interface and interaction.

## How to Use:

1. Enter a long URL into the input field and submit.
2. Receive a shortened URL along with VPN/proxy status and geographical details.
3. Copy the shortened URL to the clipboard for easy sharing.

## Installation:

1. Clone the repository and configure `config.php` with database credentials.
2. Create a MySQL database (e.g., `url_shortener`) on your server.
3. Import the provided SQL dump to create the necessary tables:

   ```sql
   -- Paste the SQL dump provided here
   ```

4. Ensure PHP and MySQL are installed on your server.
5. Start using SecureURL Shortener by accessing its URL on your server.

## Geolocation Restrictions:

- Access to SecureURL Shortener is restricted to users from EU member countries only.
- Non-EU users will be denied access based on their geolocation information retrieved during the visit.

## Contribution:

Contributions are welcome! Fork the repository, make improvements, and submit a pull request.

## License:

This project is licensed under the MIT License. See the LICENSE file for more details.

---
