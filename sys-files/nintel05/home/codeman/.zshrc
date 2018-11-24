# Command to get ohmyzsh: (help url: https://github.com/robbyrussell/oh-my-zsh)
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/codeman/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="bureau" 
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
fi

source $MYDATA/git/configs-git/zsh/zshrc-user.sh

# edit PATH in ~/.profile
#export PATH="/home/codeman/.itsoflife/local/packages-live/llvm-clang6/build/bin:$MYDATA/local/packages-live/qt5/Tools/QtCreator/bin:$MYDATA/local/packages-live/GoLand-2018.2/bin:$MYDATA/local/packages-live/clion-2018.2/bin:$MYDATA/local/packages-live/pycharm-2018.2/bin:$PATH"

#MY_LLVM_PATH="/home/codeman/mydata/local/packages-live/clang-llvm5/build/bin"
#export PATH=$MY_LLVM_PATH:$PATH

### Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
##export COCOS_CONSOLE_ROOT="/home/codeman/mydata/local/tmp/downloads/cocos2d-x/cocos2d-x-3.16/tools/cocos2d-console/bin"
##export PATH=$COCOS_CONSOLE_ROOT:$PATH
##
### Add environment variable COCOS_X_ROOT for cocos2d-x
##export COCOS_X_ROOT="/home/codeman/mydata/local/tmp/downloads/cocos2d-x"
##export PATH=$COCOS_X_ROOT:$PATH
##
### Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
##export COCOS_TEMPLATES_ROOT="/home/codeman/mydata/local/tmp/downloads/cocos2d-x/cocos2d-x-3.16/templates"
##export PATH=$COCOS_TEMPLATES_ROOT:$PATH
#
## Add environment variable NDK_ROOT for cocos2d-x
#export NDK_ROOT="/home/codeman/Android/Sdk/ndk-bundle"
#export PATH=$NDK_ROOT:$PATH
#
## Add environment variable ANDROID_SDK_ROOT for cocos2d-x
#export ANDROID_SDK_ROOT="/home/codeman/Android/Sdk"
#export PATH=$ANDROID_SDK_ROOT:$PATH
#export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
#
## Add environment variable ANT_ROOT for cocos2d-x
#export ANT_ROOT="/usr/share/ant/bin"
#export PATH=$ANT_ROOT:$PATH



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/codeman/.sdkman"
[[ -s "/home/codeman/.sdkman/bin/sdkman-init.sh" ]] && source "/home/codeman/.sdkman/bin/sdkman-init.sh"
