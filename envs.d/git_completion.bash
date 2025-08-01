# Git completion file candidates
bash_git_completions_candidates=(
    "$HOME/.git-completion.bash"
    "$HOME/git-completion.bash"
    "$HOME/.bash_completion.d/git"
    "$HOME/.config/bash_completion.d/git"

    "/usr/share/bash-completion/completions/git"
    "/etc/bash_completion.d/git"
    "/usr/local/etc/bash_completion.d/git"
    "/usr/share/git-core/contrib/completion/git-completion.bash"
    "/usr/lib/git-core/git-completion.bash"
    "/usr/share/bash-completion/completions/git-completion.bash"
)

for git_path in "${bash_git_completions_candidates[@]}"; do
    if [[ -f "$git_path" ]]; then
        source "$git_path"
        break
    fi
done
