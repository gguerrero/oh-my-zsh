# Path and suffix colors for root and users
local path_color=''
local path_suffix=''
if [ $UID -eq 0 ]; then 
  path_color="red"
  path_suffix="#"
else
  path_color="gray"
  path_suffix="$"
fi

local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local pwd='%{$fg[$path_color]%}%2~${path_suffix} %{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Prompts
PROMPT="${pwd}"
RPROMPT="${git_branch} ${rvm} ${return_code}"

# Git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}[%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg[yellow]%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗"