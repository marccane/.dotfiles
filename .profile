#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$HOME/scripts/prio:$PATH
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/canethings
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

export NIHSTRO=$HOME/canethings/nihstro/build
export AEMSTRO=$HOME/canethings/aemstro

export VITASDK=/usr/local/vitasdk
export PATH=$PATH:$VITASDK/bin # add vitasdk tool to $PATH

export SCALA_HOME=/usr/local/share/scala
export PATH=$PATH:$SCALA_HOME/bin

export GOBIN=$HOME/go/bin
export GOPATH=$HOME/go

export MAKEFLAGS="-j$(nproc)"
export RUSTFLAGS="-C link-arg=-fuse-ld=lld"

numlockx
setxkbmap es,ru -option grp:alt_shift_toggle
