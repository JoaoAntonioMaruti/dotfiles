# oh-my-zsh joaoantoniomaruti oh-my-zsh personal theme

# INSPIRATION: https://github.com/alejandromume/ubunly-zsh-theme

### Git [±master ▾●]

ZSH_THEME_GIT_PROMPT_PREFIX="~ %{$fg_bold[green]%}±%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

git_info () {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

git_status() {
  local result gitstatus
  gitstatus="$(command git status --porcelain -b 2>/dev/null)"

  # check status of files
  local gitfiles="$(tail -n +2 <<< "$gitstatus")"
  if [[ -n "$gitfiles" ]]; then
    if [[ "$gitfiles" =~ $'(^|\n)[AMRD]. ' ]]; then
      result+="$ZSH_THEME_GIT_PROMPT_STAGED"
    fi
    if [[ "$gitfiles" =~ $'(^|\n).[MTD] ' ]]; then
      result+="$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi
    if [[ "$gitfiles" =~ $'(^|\n)\\?\\? ' ]]; then
      result+="$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi
    if [[ "$gitfiles" =~ $'(^|\n)UU ' ]]; then
      result+="$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi
  else
    result+="$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  # check status of local repository
  local gitbranch="$(head -n 1 <<< "$gitstatus")"
  if [[ "$gitbranch" =~ '^## .*ahead' ]]; then
    result+="$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if [[ "$gitbranch" =~ '^## .*behind' ]]; then
    result+="$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if [[ "$gitbranch" =~ '^## .*diverged' ]]; then
    result+="$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  # check if there are stashed changes
  if command git rev-parse --verify refs/stash &> /dev/null; then
    result+="$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo $result
}

git_prompt() {
  # check git information
  local gitinfo=$(git_info)
  if [[ -z "$gitinfo" ]]; then
    return
  fi

  # quote % in git information
  local output="${gitinfo:gs/%/%%}"

  # check git status
  local gitstatus=$(git_status)
  if [[ -n "$gitstatus" ]]; then
    output+=" $gitstatus"
  fi

  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${output}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

_PATH="%{$fg_bold[white]%}%~%{$reset_color%}"

if [[ $euid -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg[green]%}$"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%m"
_LIBERTY="$_LIBERTY%{$reset_color%}"

add_stack_icon() {
  ELIXIR="%{$fg[magenta]%}%{$reset_color%}"
  VIM="%{$fg[green]%}%{$reset_color%}"
  JAVASCRIPT="%{$fg[yellow]%}%{$reset_color%}"
  DART="%{$fg[blue]%}%{$reset_color%}"

  OUTPUT=""

  if [[ -n "$(ls | grep mix.exs)" ]]; then
    OUTPUT=" $ELIXIR"
  fi

  if [[ -n "$(ls | grep package.json)" ]]; then
    OUTPUT=" $JAVASCRIPT"
  fi

  if [[ -n "$(ls | grep .pubspec.yaml)" ]]; then
    OUTPUT=" $DART"
  fi

  if [[ -n "$(ls | grep .vimrc)" ]]; then
    OUTPUT=" $VIM"
  fi

  echo "$OUTPUT"
}

setopt prompt_subst

RPROMPT='$(add_stack_icon) %(4~|.../%2~|%~) $(git_prompt)'

local smiley="%(?,%{$fg[green]%}✅ > %{$reset_color%},%{$fg[red]%}🤡 > %{$reset_color%})"
PROMPT="${smiley}"
local cur_cmd="${blue_op}%_${blue_cp}"
RIGTH_PROMPT="${cur_cmd}> "

