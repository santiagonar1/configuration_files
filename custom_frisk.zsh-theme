MODE_INDICATOR="%{$fg_bold[red]%}[NORMAL]%{$reset_color%}"

if [[ -z "${VIMRUNTIME}"  ]]; then
PROMPT=$'
%{$fg[red]%}%~ $(git_prompt_info)%{$fg[white]%}[%T]
%{$fg_bold[blue]%}[%m] >%{$reset_color%} '
else
PROMPT=$'
%{$fg[red]%}%~ $(git_prompt_info)%{$fg_bold[red]%}[vim] %{$reset_color%}%{$fg[white]%}[%T]
%{$fg_bold[blue]%}[%m] >%{$reset_color%} '
fi

PROMPT2="%{$fg_bold[white]%}%_> %{$reset_color%}"

GIT_CB=""
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
