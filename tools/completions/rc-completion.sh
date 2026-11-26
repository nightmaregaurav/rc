# Single argcomplete dispatcher for all RC tools.
# Instead of sourcing 56 per-command completion files (4,536 lines of identical
# boilerplate), this file defines the argcomplete helper functions once and
# registers every tool from tools/scripts/ dynamically.

# If ARGCOMPLETE_USE_TEMPFILES is set, use tempfiles for IPC.
__python_argcomplete_run() {
    if [[ -z "${ARGCOMPLETE_USE_TEMPFILES-}" ]]; then
        __python_argcomplete_run_inner "$@"
        return
    fi
    local tmpfile="$(mktemp)"
    _ARGCOMPLETE_STDOUT_FILENAME="$tmpfile" __python_argcomplete_run_inner "$@"
    local code=$?
    cat "$tmpfile"
    rm "$tmpfile"
    return $code
}

__python_argcomplete_run_inner() {
    if [[ -z "${_ARC_DEBUG-}" ]]; then
        "$@" 8>&1 9>&2 1>/dev/null 2>&1 </dev/null
    else
        "$@" 8>&1 9>&2 1>&9 2>&1 </dev/null
    fi
}

_python_argcomplete() {
    local IFS=$'\013'
    local script=""
    if [[ -n "${ZSH_VERSION-}" ]]; then
        local completions
        completions=($(IFS="$IFS" \
            COMP_LINE="$BUFFER" \
            COMP_POINT="$CURSOR" \
            _ARGCOMPLETE=1 \
            _ARGCOMPLETE_SHELL="zsh" \
            _ARGCOMPLETE_SUPPRESS_SPACE=1 \
            __python_argcomplete_run ${script:-${words[1]}}))
        local nosort=()
        local nospace=()
        if is-at-least 5.8; then
            nosort=(-o nosort)
        fi
        if [[ "${completions-}" =~ ([^\\\\]): && "${match[1]}" =~ [=/:] ]]; then
            nospace=(-S '')
        fi
        _describe "${words[1]}" completions "${nosort[@]}" "${nospace[@]}"
    else
        local SUPPRESS_SPACE=0
        if compopt +o nospace 2> /dev/null; then
            SUPPRESS_SPACE=1
        fi
        COMPREPLY=($(IFS="$IFS" \
            COMP_LINE="$COMP_LINE" \
            COMP_POINT="$COMP_POINT" \
            COMP_TYPE="$COMP_TYPE" \
            _ARGCOMPLETE_COMP_WORDBREAKS="$COMP_WORDBREAKS" \
            _ARGCOMPLETE=1 \
            _ARGCOMPLETE_SHELL="bash" \
            _ARGCOMPLETE_SUPPRESS_SPACE=$SUPPRESS_SPACE \
            __python_argcomplete_run ${script:-$1}))
        if [[ $? != 0 ]]; then
            unset COMPREPLY
        elif [[ $SUPPRESS_SPACE == 1 ]] && [[ "${COMPREPLY-}" =~ [=/:]$ ]]; then
            compopt -o nospace
        fi
    fi
}

# Register all RC tools dynamically by scanning tools/scripts/
# Uses the same detection logic as rc-ls: files that are not hidden,
# have no extension, and are not symlinks.
if [ -z "${_rc_completions_loaded:-}" ] && [[ -d "$current_rc_script_dir/tools/scripts" ]]; then
    if [[ -n "${ZSH_VERSION-}" ]]; then
        autoload is-at-least
    fi
    for f in "$current_rc_script_dir/tools/scripts"/*; do
        # Skip if not a regular file or is a symlink
        [ -f "$f" ] && [ ! -L "$f" ] || continue
        cmd="$(basename "$f")"
        # Skip hidden files
        [[ "$cmd" == .* ]] && continue
        # Skip files with extensions (only register extension-less scripts)
        [[ "$cmd" == *.* ]] && continue
        # Register completion for this command
        if [[ -z "${ZSH_VERSION-}" ]]; then
            complete -o nospace -o default -o bashdefault -F _python_argcomplete "$cmd"
        else
            compdef _python_argcomplete "$cmd"
        fi
    done
    _rc_completions_loaded=1
fi
