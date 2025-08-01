zsh_git_completions_candidates=(
    "/usr/share/zsh/site-functions/git-completion.zsh"
    "/usr/share/zsh/site-functions/_git"
)

for git_path in "${zsh_git_completions_candidates[@]}"; do
    if [[ -f "$git_path" ]]; then
        source "$git_path"
        break
    fi
done
