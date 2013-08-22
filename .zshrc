# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


sign-apk-dir () {
  rm -rf $1.apk
  cd $1
  rm -rf META-INF/*
  zip -r ../$1.apk *
  cd ..
  jarsigner -verbose -sigalg MD5withRSA -digestalg SHA1 -keystore ~/.android/debug.keystore $1.apk androiddebugkey -storepass android
}

R_HOME=/usr/lib/R
#GIT=/home/madis/cryptodev/git

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gor="goreplace"

# alias astop="adb -d shell 'su -c kill \`ps | grep $1 | awk \'{ print \$2 }\'\`'"
#astop () { adb -d shell su -c kill `ps | grep $1 | awk \'{ print \$2 }\'` }
# alias astop="adb -d shell echo \\\`ps \| grep $1 \| awk \'{print \\\$2}\'\\\`"
astop () { adb -d shell su -c kill \`ps \| grep $1 \| awk \'{print \$2}\'\` }
aclear () { adb -d shell pm clear \`pm list packages $1 \| sed -e "s/package://" \| head -n 1\` }
astack () { adb -d shell su -c kill -3 \`ps \| grep $1 \| awk \'{print \$2}\'\` }
# alias aclear="adb -d shell pm clear $1"

logcat () { adb -d logcat -v time $@ | logcat_prettifier }
logcate () { adb -e logcat -v time $@ | logcat_prettifier }

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails ant bundler cap debian gem gnu-utils rails3 rvm golang)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

alias antlr4="java -jar $HOME/bin/antlr-4.0-complete.jar"
alias grun="java org.antlr.v4.runtime.misc.TestRig"

PATH=$HOME/node_modules/.bin:$PATH

autoload -U zmv
