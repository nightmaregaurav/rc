import os
import shlex
import subprocess
from shutil import which


def run_in_invoking_shell(commands: list[str]) -> subprocess.CompletedProcess:
    shell_path = os.environ.get("CURRENT_SHELL")
    if shell_path and which(shell_path):
        cmd_str = shlex.join(commands)
        return subprocess.run([shell_path, "-i", "-c", cmd_str])
    if os.name == "nt":
        # Let subprocess apply Windows command-line quoting for the shell.
        return subprocess.run(commands, shell=True)
    return subprocess.run(shlex.join(commands), shell=True)