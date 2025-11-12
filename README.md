# RC (Runtime Configuration)

This repository provides a collection of environment variable setups, aliases, and functions to enhance your shell experience. It is designed to be sourced in your `.bashrc` or `.zshrc` file to enable a variety of utilities and configurations.

## Installation

To use this repository, clone it and source the activate script in your shell configuration file:

### Option 1 (persistent): Add to `.bashrc` or `.zshrc`
```bash
curl https://github.com/nightmaregaurav/rc/raw/refs/heads/main/setup | bash
```
Then, add the following line to your `~/.bashrc` or `~/.zshrc` file:
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

### Scripts
The following scripts are included to simplify common tasks:

- **`adbw-brute-pair`**: Pairs with an Android device over wireless ADB.
- **`amplify`**: Boosts volume in the provided video/audio file.
- **`clip`**: Copies and pastes text to/from the clipboard.
- **`count`**: Counts the total number of files and folders in the current directory.
- **`cpu-usage`**: Displays CPU usage percentage.
- **`duplicates`**: Manages duplicate files by listing, or deleting them.
- **`free-port-after`**: Finds a free port after a specified port.
- **`git as`** or **`git-as`** To run git commands as a profile.
- **`git lsprofile`** or **`git-lsprofile`** To list all git profiles.
- **`git mkprofile`** or **`git-mkprofile`** To create a new git profile.
- **`git rmprofile`** or **`git-rmprofile`** To remove a git profile.
- **`hear-me`**: Listens in using all available microphones and saves the audio to a file.
- **`img2pdf`**: Converts images into a single PDF file.
- **`localip`**: Prints the local IP address.
- **`localip-fast`**: Prints the local IP address, a little faster than `localip`.
- **`location-of`**: Extracts GPS location metadata from images or videos.
- **`ls-openports`**: Lists open ports on the local machine.
- **`mkcd`**: Creates a directory and changes into it.
- **`mssql-backup`**: Wrapper of `sqlpackage` to easily backup SQL Server databases.
- **`mssql-restore`**: Wrapper of `sqlpackage` to easily restore SQL Server databases.
- **`noexif`**: Removes EXIF metadata from images.
- **`now`**: Shows the current date and time in a human-readable format.
- **`organize-media`**: Organizes images and videos in a folder by their creation date.
- **`pdf2img`**: Converts a pdf pages into images.
- **`pdf2img-extract`**: Extracts images from PDF file.
- **`publicip`**: Prints the public IP address.
- **`publicip-fast`**: Prints the public IP address, a little faster than `publicip`.
- **`rc-setup-completions`**: Installs the completion files for the scripts in this repository.
- **`rc-setup-uv`**: Installs and configures the `uv` package to run python scripts in this repository.
- **`rc-update`**: Updates this project to the latest version.
- **`re-run`**: Keeps running a command on given time intervals.
- **`recurse-run`**: Recursively runs a command in all subdirectories.
- **`serve`**: Simple wrapper for http-server (node)
- **`snap-camera`**: Captures photos using available cameras.
- **`snap-screen`**: Captures screenshots for all available screens.
- **`split-video`**: Splits a video file into multiple parts in chunks of the specified duration.
- **`up-since`**: Shows how long the system has been up since last reboot.
- **`user-session-ssh`**: Tool to install/uninstall ssh server to run on logged in user's session for Windows.
- **`volume-control`**: Controls the volume of the system.
- **`watchtower`**: Monitors a file and executes a command when the file changes.
- **`youtube-get`**: Downloads YouTube videos or audio.

## Usage
After sourcing the activate script, all the environment variables, aliases, and functions will be available in your shell. Use the `--help` or `-h` flag with any function to see detailed usage instructions.

## Soft Requirement (only errors out while executing related commands)
- **`android-platform-tools`**: Used by `adbw-brute-pair`
- **`ffmpeg`**: Used by `amplify`, `split-video`, and `youtube-get`
- There are some others, will add eventually... sorry...

## Contributing
Feel free to fork this repository and submit pull requests to add new features or improve existing ones.

## License
This project is licensed under the MIT License.
