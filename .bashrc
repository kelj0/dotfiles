# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(git_branch)\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

#== ALIASES ==#
alias gaa='git add --all'
alias gca='git commit'
alias gst='git status'
alias gps='git push'
alias xgps='git push && x-files'

alias python='python3'
alias ptpython='python3 -m ptpython'
alias pls='python ~/github/LearningPython/RandomStuff/pls.py'

alias tmuj='tmux attach -t '
alias tmul='tmux list-sessions'
alias smol='python3 -c "$(curl -s https://pastebin.com/raw/ZmYt5C1L)"'

#== Functions ==#
function startrs { (redshift -l 68.5:7.4 -t 3200:3200)&> /dev/null & }
function stoprs { kill `ps aux | grep redshift | head -n 1 | awk '{print $2}'`; }
function git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function davaiip { host $1 | awk '/address/ {print $NF}'; }

function x-files {
    echo -n 'UUUUF15M7Y?SrN3a4K5]6ka8K9%|@5V%bM5*16t_*SWZ23aiaR|>31*43C3(6?7Z8T9=7#B=4#13H6Y*GT27]9zC4%5[Z<Z12(E_rZ23a6K8]9m@7?9*<M3H6t*GraiV6}1oyf?9ZBd5YTG]8K9?|Cy[Id3>{Y*GN1qZ23K7]8*7sy*7[?<?E_*SmC6OT8TBZ<d6YN1qa8K9I4Q5@BIJE*Gl*BIM3H8Y*SWa3J29>39Is8*B?<d4V6I2vMS?n8?9ZB?XY*47O4Q2Q^8uI*12v@7Z8?9[T<*G%hoyH2(hlmo8uIf9CwC<2cbI2Q5CEJ<2Q3HSC7(B_kQ9vgYMGHSc8}QMS@<(ECG@UFBf4><2CF1GC9CUBCFB@h@F8uM7M8(Gg[*17_K8@2^bKiC8IN9C9[kN8l><K^bKi(48c28KR46c9k@BICbCBQg*Bl@bCFB@FBChCF^UUUF151M53@{8H4^{8d49?n150H51@151C{7H49M50d52@{7M48d50@151H52@Uj?S>28KR76W7C17H8t*SJ27%|J38V4pV7W5@j?SN8]9O4m*77W1PsXt*SJ38V5pfR90q4P5*njzO7f9P7P8*nXt*74V5u0}1P5Cj(46V5zW4@XYmV6J89>w*<4P5CEI4gY>47(55I3C36>37>76?wMG?G3>A6obV4O7MS(G0?G1C<>75pQ9>E6(E7(G2_3g[O7fR91}2v>G1_2lQV5u0u1JE^bV4(89_1lI_0_1g[Q2I3I5Y9_2C8Q3IsbI3J<s<1Q2vMS(G3W7g[O4mQ9HSW2P4q5?n<9vP1W3P4*n91vP5W6q7?nA6r7@BP1JA2C<2Q3>A3WsBI3P7P8*nFB@270@1GK65K67N68]6^263K65N66]67@267N68k0a71C268@264@265C269J270K72cU17?XZE?S]8a9M70W6P8CBQH4>17H8TETSK7NR|W2W3q5r6cXZEZSN8]9P2P4q5K70CXtT2i(|P2JA5JA7r8*njZGKRA4>A5>A7CXYTG]7]8%39JA1P2@E?Ga8N9P4>A5r6@E*GN8(47%48P8@E(GCE_kN8%47W6CEK9%36H6RA5P7W8CEkW6c28J29oBkgYJ28P7CBC9CB@^BC9CB@^UB@U9oUUU57cUU7}d4O4V5C3(4?5(8?B*<*{H5tmV6C8}*BH2M3V4pV7C5f[?<d3M4?75p>8R90?n5u?Bd2H4M5(h%57pf^7(8(BQ*12H6Jh(57V6g*B*13H4%h>wl[I(hI2Q3*<4g?BM4H5%55c4(8IH3M5Q2?wC9*BpI3MGC5f[IM4zV7J<9>1SCbJ75lImpf9?91c9[H4N3K4o<(8^Rh@75I2I4><5@wC23Q3Is<2>1GMSC<1Q^EK3I9>1G@1G@XCXYN3@EoE@bM4(EJw@X>n' | hexdump -v -e '/1 "%u\n"' | awk 'function d(f,k,a,b,o,w,i,q,h,j){for(k=32;k<127;k++)o[sprintf("%c", k)]=k;split("e-0,,, 2x,,=1#,=-1,,&#,=-2,=2#,+,,-,.,9 3,0,1,2,3,4,5,6,7,8,9,0=0,;,11,=,=/x,)#,%n,22,10,(n,=-/,19,:n,20,%1,(<,Dx,(2,=-3,(1,%2,%7,%A,%<,9(,21,=3#,FF,(7,(A,18,%E,L#,%B,,*2,9@,%G,,?2,RB,>n,?1,e,%8,@9,56,7K8,X?E,N7,@8,O5,,Jn,O6,?A,*A,4C,*E,(9,HG,<3,x,5%6,?76,14,30,%9,,",a,",");split("0,1,2,3,4,5,6,7,8,9,=,e,x,+,-,.,n,;",w,",");q=0;for(g in w)if(o[w[g]]==f)q++;i=f-32+1;if(q>0)printf(f==110?"\n":a[i]);else{h=split(a[i],b,"");for(j=0;j<h;j++)d(o[b[j+1]]);}}d($1)' | awk 'BEGIN{L=2400;N=8192;for(n=0;n<L;n+=1)o[n+1]=0;}{l=split($1,t,"x");for(j=0;j<l;j+=1){split(t[j+1],p,"=");x[j+1]=p[2];f[j+1]=p[1];}M=(NR==200?2400:2*L);for(n=0;n<M;n+=1){R=0;for(j=0;j<l;j+=1){a=cos(2*3.141592*f[j+1]*(n/N)*1.000000);R+=(x[j+1]*a);}if(n<L){R=(R*(n/L))+(o[n+1]*((L-n)/L));R*=5.000000;R=int(R*32767);printf("%04X\n",R==0?0:(R>0?(R>32767?32767:R):(R<-32768?32768:65536+R)));}else if(n<2*L){o[n-L+1]=R;}}}' | awk '{a[i++]=$0}END{while(j<i)print a[j++]}' | xxd -r -p | aplay -q -c 1 -f S16_BE -r 48000
}

function listening() { lsof -n -iTCP:$1 | grep LISTEN; }

function openedports() { ss -tulpn | grep LISTEN | awk '{{for(i=5;i<=NF;++i) printf "%s ", $i} print "" }'; }

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GOPATH=$HOME/go
PATH=$GOPATH/bin:$PATH
