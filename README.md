# RC (Runtime Configuration)

This repository provides a collection of environment variable setups, aliases, and functions to enhance your shell experience. It is designed to be sourced in your `.bashrc` or `.zshrc` file to enable a variety of utilities and configurations.

## Installation

To use this repository, clone it and source the activate script in your shell configuration file:

### Option 1 (persistent): Add to `.bashrc` or `.zshrc`
```bash
source ~/<path>/<to>/<cloned>/<folder>/activate
```

### Option 2 (temporary): Clone and activate directly
```bash
cd ~ && git clone https://github.com/nightmaregaurav/rc.git && source ~/rc/activate
```

## Features

### Environment Variables
Environment variables are set up to aid with the following:

- Adds most common executable directories to the `PATH`.
- Configurations for Homebrew, Docker, git, Node, Java, DotNET, Android, and Python

### Aliases
Some aliases are added for convenience:

- **`publicip`**: Displays the public IP address.
- **`da`**: Displays the current date and time in a readable format.
- **`openports`**: Lists open ports.
- **`cpu`**: Displays CPU usage percentage.
- **`timeout`**: To use timeout in osx where `gtimeout` is available but not `timeout`.

### Scripts
The following scripts are included to simplify common tasks:

- **`adbw-brute-connect`**: Connects to an Android device over wireless ADB by scanning ports.
- **`adbw-brute-pair`**: Pairs with an Android device over wireless ADB.
- **`amplify`**: Boosts volume in the provided video/audio file.
- **`count`**: Counts the total number of files and folders in the current directory.
- **`extract-gps-location-from-image`**: Extracts GPS location metadata from images or videos.
- **`extract-image-from-pdf`**: Extracts images from a PDF file.
- **`free-port-after`**: Finds a free port after a specified port.
- **`from-clipboard`**: Pastes text from the clipboard.
- **`localip`**: Prints the local IP address.
- **`localip-fast`**: Prints the local IP address, a little faster than `localip`.
- **`ls-openports`**: Lists open ports on the local machine.
- **`mkcd`**: Creates a directory and changes into it.
- **`now`**: Shows the current date and time in a human-readable format.
- **`organize-images-and-videos-by-date`**: Organizes images and videos in a folder by their creation date.
- **`publicip`**: Prints the public IP address.
- **`publicip-fast`**: Prints the public IP address, a little faster than `publicip`.
- **`recurse-run`**: Recursively runs a command in all subdirectories.
- **`remind-me`**: Sets a reminder with a message at a specific time and date.
- **`serve`**: Simple wrapper for http-server (node)
- **`split-video`**: Splits a video file into multiple parts in chunks of the specified duration.
- **`to-clipboard`**: Copies text to the clipboard.
- **`update-rc`**: Updates this project to the latest version.
- **`youtube-get`**: Downloads YouTube videos or audio.

### Extras
The following extra features are included to simplify tasks:
- Added `as <profile_name>`, `mkprofile`, `lsprofile`, and `rmprofile` aliases to `git` command so that it's easy to switch between git profiles (username, email and ssh key).
  - Examples:
    - `git mkprofile` [Follow steps] To create a new git profile.
    - `git lsprofile` To list all git profiles.
    - `git rmprofile <profile_name>` To remove a git profile.
    - `git as <profile_name> commit -m "initial commit as a profile"` To make a commit using a profile.

## Usage
After sourcing the activate script, all the environment variables, aliases, and functions will be available in your shell. Use the `--help` or `-h` flag with any function to see detailed usage instructions.

## Soft Requirement (only errors out while executing related commands)
- **`android-platform-tools`**: Used by `adbw-brute-connect` and `adbw-brute-pair`
- **`nmap`**: Used by `adbw-brute-connect` and `adbw-brute-pair`
- **`ffmpeg`**: Used by `amplify`
- There are some others, will add eventually... sorry...

## Contributing
Feel free to fork this repository and submit pull requests to add new features or improve existing ones.

## License
This project is licensed under the MIT License.
