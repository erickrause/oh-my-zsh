# Show number of stashed items (BinaryMuse)
git_stash() {
  git stash list 2> /dev/null | wc -l | sed -e "s/ *\([0-9]*\)/\ \+\1/g" | sed -e "s/ \+0//"
}

# Prompt PWD
# http://github.com/bjeanes/dot-files/blob/master/shell/prompt.sh
if [ `uname -s` = "Darwin" ]; then
  function prompt_pwd() {
    if [ "$PWD" != "$HOME" ]; then
      printf "%s" `echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|" -e 's-/\(\.\{0,1\}[^/]\)\([^/]*\)-/\1-g'`
      echo $PWD|sed -e 's-.*/\.\{0,1\}[^/]\([^/]*$\)-\1-'
    else
      echo '~'
    fi
  }
else # defined two for diff systems because Fish did (not entirely sure why)
  function prompt_pwd() {
    case "$PWD" in
      $HOME)
        echo '~'
        ;;
      *)
        printf "%s" `echo $PWD|sed -e "s|^$HOME|~|" -e 's-/\(\.\{0,1\}[^/]\)\([^/]*\)-/\1-g'`
        echo $PWD|sed -n -e 's-.*/\.\{0,1\}.\([^/]*\)-\1-p'
        ;;
    esac
  }
fi

# %3~ # Shows 3 directories deep
PROMPT='[%{${fg_bold[green]}%}$(prompt_pwd)%{${reset_color}%}]%{${fg[yellow]}%} »%{${reset_color}%} '
RPROMPT='%{${fg_bold[cyan]}%}$(rvm_prompt_info)%{${reset_color}%} %{${fg_bold[yellow]}%}$(git_prompt_info)%{${reset_color}%}$(git_stash) [%T]'

# PROMPT2="%{${fg[$(prompt_color)]}%}»%{${reset_color}%} "
# RPROMPT2='[%_]'

# Git theming
ZSH_THEME_GIT_PROMPT_PREFIX="± ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="^" # Not implimented in the current oh-my-zsh version.

# The escape codes are surrounded by %{ and %}. These are zsh prompt escapes that tell the shell to disregard the contained characters when 
# determining the length of the prompt. This allows zsh to properly position the cursor.