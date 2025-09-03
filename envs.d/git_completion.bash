# Git completion file candidates
bash_git_completions_candidates=(
    "/etc/bash_completion.d/git"
    "/usr/lib/git-core/git-completion.bash"
    "/usr/share/bash-completion/completions/git"
    "/usr/share/bash-completion/completions/git-completion.bash"
    "/usr/share/git-core/contrib/completion/git-completion.bash"
    "/usr/local/etc/bash_completion.d/git"

    "$HOME/git-completion.bash"
    "$HOME/.git-completion.bash"
    "$HOME/.bash_completion.d/git"
    "$HOME/.config/bash_completion.d/git"
)

for git_path in "${bash_git_completions_candidates[@]}"; do
    if [[ -f "$git_path" ]]; then
        source "$git_path"
        break
    fi
done
