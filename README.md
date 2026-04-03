# Cydia Webview Modifier

Tweak to modify URL loaded in Cydia webviews

## Usage

Install the deb from the [latest release](https://github.com/LukeZGD/CydiaWebviewModifier/releases/latest), or from my repo: https://lukezgd.github.io/repo

## Available URLs

- `https://cydia.saurik.com` (default used by Cydia)
- `http://cydia.saurik.com` (same as default but without HTTPS; useful if the certificate for `cydia.saurik.com` expires or HTTPS breaks)
- `https://lukezgd.github.io/CydiaWebviewModifier` (sample mirror of `cydia.saurik.com`, useful as fallback if the server is down/unreachable, or for self-host setups)

## Default Settings

The tweak is enabled by default after installation and uses `http://cydia.saurik.com`, making it behave similarly to the Cydia HTTPatch tweak.

There are only two settings:

- Enabled (toggle)
- URL (can be set to any of the URLs above or your own self-host)
