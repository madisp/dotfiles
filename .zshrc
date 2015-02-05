alias git=hub

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# alt + arrow word navigation
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

screenshot () {
	adb -d shell screencap /sdcard/$1.png
	adb -d pull /sdcard/$1.png
	adb -d shell rm /sdcard/$1.png
}

sign-apk-dir () {
  rm -rf $1.apk
  cd $1
  rm -rf META-INF/*
  zip -r ../$1.apk *
  cd ..
  jarsigner -verbose -sigalg MD5withRSA -digestalg SHA1 -keystore ~/.android/debug.keystore $1.apk androiddebugkey -storepass android
}

mp-git-clone () {
	local repo=$1
	local local_folder=$2
	local user_name=$3
	local user_email=$4
	echo ">>> git clone $repo $local_folder"
	git clone $repo $local_folder
	echo ">>> cd $local_folder"
	cd $local_folder
	echo ">>> git config user.name $user_name"
	git config user.name $user_name
	echo ">>> git config user.email $user_email"
	git config user.email $user_email
	echo ">>> git submodule update --init --recursive"
	git submodule update --init --recursive
}

ghgc () {
	local reponame=$1
	local folder=$2
	# clone and cd into folder
	if [[ -z $2 ]]; then folder=$reponame fi
	mp-git-clone "git@github.com:madisp/$1.git" "$folder" "Madis Pink" "madis.pink@gmail.com"
}

clriml () {
	for fic in **/*.iml; rm -rf $fic;
	for fic in **/.idea; rm -rf $fic;
}

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias avengers="gradle"

# alias astop="adb -d shell 'su -c kill \`ps | grep $1 | awk \'{ print \$2 }\'\`'"
astop () { adb -d shell su -c kill \`ps \| grep $1 \| awk \'{print \$2}\'\` }
aclear () { adb -d shell pm clear \`pm list packages $1 \| sed -e "s/package://" \| head -n 1\` }
astack () { adb -d shell su -c kill -3 \`ps \| grep $1 \| awk \'{print \$2}\'\` }

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
plugins=(git ruby rails ant bundler cap debian gem gnu-utils rails rvm golang)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

export CLASSPATH=".:$HOME/bin/antlr-4.1-complete.jar:$CLASSPATH"
alias antlr4="java -jar $HOME/bin/antlr-4.1-complete.jar"
alias grun="java org.antlr.v4.runtime.misc.TestRig"

alias gsur="git submodule update --init --recursive"

export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export GOROOT=$HOME/dev/go
export GOBIN=$GOROOT/bin
export GOAPPENG=$HOME/dev/go_appengine
export ANDROID_HOME=$HOME/dev/android-sdk-macosx
export ANDROID_SDK=$ANDROID_HOME
export ANDROID_NDK=$HOME/dev/android-ndk
export ANDROID_BUILD_TOOLS=21.0.0
export ANDROID_PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS
export GOPATH=$HOME/Code/go

# not sure if this is right ...
export ARMEABI_GDB_BIN=$ANDROID_NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86_64/bin
export X86_GDB_BIN=$ANDROID_NDK/toolchains/x86-4.8/prebuilt/darwin-x86_64/bin

PATH=$PATH:$HOME/bin:$ANDROID_PATH:$GOBIN:$GOPATH/bin:$ANDROID_NDK:$ARMEABI_GDB_BIN:$X86_GDB_BIN:$GOAPPENG

export PATH=$HOME/node_modules/.bin:$PATH

autoload -U zmv

# locale to UTF8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF_8
export JAVA_HOME=$(/usr/libexec/java_home)

doge
