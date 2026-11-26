import os
import subprocess
from shutil import which


def run_in_invoking_shell(commands: list[str]) -> subprocess.CompletedProcess:
    shell_path = os.environ.get("CURRENT_SHELL")
    if shell_path and which(shell_path):
        # Convert list -> properly escaped string
        cmd_str = " ".join(commands)
        # Pass the shell binary as executable, command as string
        return subprocess.run([shell_path, "-i", "-c", cmd_str])
    else:
        # Windows fallback, shell=True is required, command must be string
        return subprocess.run(commands, shell=True)


def wrap_text(text: str, character: str) -> str:
    return character + text + character