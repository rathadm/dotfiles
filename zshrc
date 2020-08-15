source ~/.dotfiles/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
# Load the theme
antigen theme robbyrussell
# Tell antigen that you're done
antigen apply
