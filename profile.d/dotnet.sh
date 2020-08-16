export DOTNET_ROOT="${HOME}/.dotnet"
export PATH="${DOTNET_ROOT}:${PATH}:${DOTNET_ROOT}/tools"

# bash parameter completion for the dotnet CLI
_dotnet_bash_complete()
{
    local word=${COMP_WORDS[COMP_CWORD]}

    local completions
    completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
    if [ $? -ne 0 ]; then
        completions=""
    fi

    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

if [ -n "$ZSH_VERSION" ]; then
    # dotnet autocomplete zsh setup
    compctl -K _dotnet_zsh_complete dotnet
elif [ -n "$BASH_VERSION" ]; then
    # dotnet autocomplete bash setup
    complete -f -F _dotnet_bash_complete dotnet
else
    :
fi
