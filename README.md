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
- Configurations for Java, DotNET, Android, Node.js, and Python.

### Aliases
Some aliases are added for convenience:

- **`publicip`**: Displays the public IP address.
- **`da`**: Displays the current date and time in a readable format.
- **`openports`**: Lists open ports.
- **`cpu`**: Displays CPU usage percentage.

### Functions
The following functions are included to simplify common tasks:

- **`mkcd`**: Creates a directory and changes into it.
- **`count`**: Counts the total number of files and folders in the current directory.
- **`to-clipboard`**: Copies text to the clipboard.
- **`from-clipboard`**: Pastes text from the clipboard.
- **`set-public-ip-to-extip-file`**: Fetches the public IP address and saves it to `~/.extip` for alias `publicip`.
- **`adbw-brute-connect`**: Connects to an Android device over wireless ADB by scanning ports.
- **`adbw-brute-pair`**: Pairs with an Android device over wireless ADB.
- **`organize-images-and-videos-by-date`**: Organizes images and videos in a folder by their creation date.
- **`extract-image-from-pdf`**: Extracts images from a PDF file.
- **`extract-gps-location-from-image`**: Extracts GPS location metadata from images or videos.
- **`remind-me`**: Sets a reminder with a message at a specific time and date.
- **`youtube-get`**: Downloads YouTube videos or audio.
- **`free-port-after`**: Finds a free port after a specified port.
- **`recurse-run`**: Recursively runs a command in all subdirectories.

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

## Contributing
Feel free to fork this repository and submit pull requests to add new features or improve existing ones.

## License
This project is licensed under the MIT License.
