import os
import subprocess
import sys
from pathlib import Path


GIT_PROFILE_DIR = Path(
    os.environ.get("GIT_PROFILE_DIR", Path.home() / ".git-ssh-profiles")
).expanduser()

REQUIRED_PROFILE_FIELDS = [
    "GIT_SSH_PROFILE__SSH_KEY_PATH",
    "GIT_SSH_PROFILE__NAME",
    "GIT_SSH_PROFILE__EMAIL",
    "GIT_SSH_PROFILE__GPG_SIGN",
    "GIT_SSH_PROFILE__GPG_FORMAT",
    "GIT_SSH_PROFILE__GPG_KEY",
]


def get_existing_profiles(profile_dir: Path = GIT_PROFILE_DIR) -> list[str]:
    """Return all existing profile names."""
    if not profile_dir.exists():
        return []
    return [
        f.name[1:]
        for f in profile_dir.iterdir()
        if f.is_file() and f.name.startswith(".")
    ]


def load_profile(profile_name: str, *, validate: bool = False) -> dict[str, str] | None:
    """Load environment variables from a .<profile> script."""
    script_path = GIT_PROFILE_DIR / f".{profile_name}"
    if not script_path.is_file():
        if validate:
            print(f"[!] Profile '{profile_name}' not found in {GIT_PROFILE_DIR}", file=sys.stderr)
            sys.exit(1)
        return None

    env = {}
    for line in script_path.read_text().splitlines():
        line = line.strip()
        if not line or not line.startswith("export "):
            continue
        key, _, value = line[len("export "):].partition("=")
        env[key.strip()] = value.strip().strip('"')

    if validate:
        missing = [key for key in REQUIRED_PROFILE_FIELDS if not env.get(key)]
        if missing:
            print(
                f"[!] Profile '{profile_name}' is missing fields: {', '.join(missing)}",
                file=sys.stderr,
            )
            sys.exit(1)

    return env


def inside_git_repo() -> bool:
    """Check if the current directory is inside a git repository."""
    result = subprocess.run(
        ["git", "rev-parse", "--is-inside-work-tree"],
        capture_output=True,
        text=True,
    )
    return result.returncode == 0


def apply_profile(profile_name: str, git_args: list[str], *, validate: bool = False) -> None:
    """Apply a profile and run the given git command."""
    env = load_profile(profile_name, validate=validate)
    if not env:
        print(f"[!] Profile '{profile_name}' not found.", file=sys.stderr)
        sys.exit(1)

    ssh_key = env["GIT_SSH_PROFILE__SSH_KEY_PATH"]
    git_name = env["GIT_SSH_PROFILE__NAME"]
    git_email = env["GIT_SSH_PROFILE__EMAIL"]
    git_gpgsign = env["GIT_SSH_PROFILE__GPG_SIGN"]
    git_gpgformat = env["GIT_SSH_PROFILE__GPG_FORMAT"]
    git_gpgkey = env["GIT_SSH_PROFILE__GPG_KEY"]

    # Outside repo — only SSH customization
    if not inside_git_repo():
        subprocess.run(
            ["git", "-c", f'core.sshCommand=ssh -i "{ssh_key}"', *git_args],
            check=False,
        )
        return

    # Inside repo — apply temporary local config
    subprocess.run(["git", "config", "--local", "user.name", git_name], check=False)
    subprocess.run(["git", "config", "--local", "user.email", git_email], check=False)
    subprocess.run(
        ["git", "config", "--local", "core.sshCommand", f'ssh -i "{ssh_key}"'],
        check=False,
    )
    subprocess.run(["git", "config", "--local", "commit.gpgsign", git_gpgsign], check=False)
    subprocess.run(["git", "config", "--local", "gpg.format", git_gpgformat], check=False)
    subprocess.run(["git", "config", "--local", "user.signingkey", git_gpgkey], check=False)
    subprocess.run(["git", *git_args], check=False)