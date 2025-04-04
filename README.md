# YouTube Automation with Robot Framework

## Installation Guide

This guide will help you set up and run the YouTube automation test using Robot Framework and Selenium.

### 1. Install Python

Robot Framework requires Python 3.6 or later. Check if Python is installed by running:

```bash
python --version
```

or

```bash
python3 --version
```

If not installed, download and install Python from [Python Official Site](https://www.python.org/downloads/).

After installation, verify that Python and `pip` are available:

```bash
python -m pip --version
```

### 2. Install Robot Framework

Install Robot Framework using `pip`:

```bash
pip install robotframework
```

Verify the installation:

```bash
robot --version
```

### 3. Install SeleniumLibrary

SeleniumLibrary is required to control web browsers. Install it with:

```bash
pip install robotframework-seleniumlibrary
```

### 4. Install WebDriver

You need to install ChromeDriver to work with Google Chrome.

#### Check Chrome Version

Check your Google Chrome version:

```bash
google-chrome --version  # For Linux/Mac
```

For Windows, open Chrome and go to:

```
chrome://settings/help
```

#### Download ChromeDriver

Download the matching version of ChromeDriver from: [ChromeDriver Official Site](https://sites.google.com/chromium.org/driver/)

#### Move ChromeDriver to System Path

Extract and place the ChromeDriver in a system path:

- **Windows:** Move `chromedriver.exe` to `C:\WebDriver\`
- **Mac/Linux:** Move `chromedriver` to `/usr/local/bin/`

### 5. Run the Test

Once everything is set up, open a terminal in the `YouTube_Automation/` folder and run:

```bash
robot --outputdir results tests/test_youtube.robot
```

This will execute the test case and capture a screenshot in the `screenshots/` folder.

## Folder Structure

```
YouTube_Automation/
│── tests/                 # Contains Robot Framework test scripts
│   ├── test_youtube.robot # Main test file
│── screenshots/           # Stores captured screenshots
│── drivers/               # Stores WebDriver files
│── requirements.txt       # Lists required dependencies
│── README.md              # Project documentation
```

### Notes

- Ensure Chrome and ChromeDriver versions match.
- Run the tests in a clean browser environment to avoid interference.

Happy testing! 🚀

