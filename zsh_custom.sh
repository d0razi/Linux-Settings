#!/bin/bash

# Set OMZ Theme & Multi line
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

AGNOSTER_THEME_FILE="$HOME/.oh-my-zsh/themes/agnoster.zsh-theme"

MULTILINE_CODE=$(cat <<'EOF'
prompt_newline() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR
%(?.%F{$CURRENT_BG}.%F{red})❯%f"

  else
    echo -n "%{%k%}"
  fi

  echo -n "%{%f%}"
  CURRENT_BG=''
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_aws
  prompt_context
  prompt_dir
  prompt_git
  prompt_bzr
  prompt_hg
  prompt_newline
  prompt_end
}
EOF
)

echo "$MULTILINE_CODE" >> "$AGNOSTER_THEME_FILE"

# Set OMZ Plugin

## auto suggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## autojump
apt install -y autojump
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump)/g' ~/.zshrc
source ~/.zshrc

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
.fzf/install

zsh
