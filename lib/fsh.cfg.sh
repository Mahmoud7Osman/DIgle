source $PODGL/lib/colors

# Output
cout2(){
printf $green"☢$white %s\n" "$*"
}
# Error
cerr2(){
printf $red"☢$white %s\n" "$*"
}
# logger
clog(){
printf "$green`whoami`$red @ `date`: $yellow%s\n" "$*" >> $PODGL/var/log/slog.bgl
}
# Check Box Yes
cby(){
printf $green"✔"$white" %s\n" "$*"
}
# Check Box No
cbn(){
printf $red"✘"$white" %s\n" "$*"
}

cin(){
printf "┌$white──[$purple$PWD$white]----[$blue$(printf $VICTIM | sed s/" "//g)$white]-[$red$PORT$white]\n$white▼$white\n$green"
read -e $1
printf "$blyellow↓$green\n"
}

rlog(){
if [ -f "var/log/slog.bgl" ];then
 cout "Removing var/log/* ... !"
 sleep 0.3
 rm $PODGL/var/log/* $PODGL/var/digle_history &> /dev/null
else cerr "No Logs Found"
fi
}

victim(){
  case $1 in
  ip) export VICTIM=$2;;
  port)export PORT=$2;;
  *) cerr Invalid Usage;;
  esac
}
prepare(){
   cout "Preparing Automated Values from $PODGL/etc/auto.dgl"
   source $PODGL/etc/auto.dgl
}
dir(){
  $PREFIX/bin/dir $1 --color
}
set(){
 if [ "$1" == '' ] || [ "$2" == '' ];then
    cerr No Enough Arguments, see info lset

 else
 export ${1^^}=$2 2>/dev/null
 printf "${green}$1${cyan} => ${yellow}$2\n"
 fi
}
use(){
if [ ! -d "$PODGL/sys/$1" ];then
   cerr "Error: Cannot Use Module '$1', Module not found"
elif [ "$1" == '' ];then
   printf "${green}use$yellow malware\n${green}use$yellow bombs\n"
else
export WHAT=$1
fi
}
prompt(){
if [ "$1" == '' ] || [ ! -f "$PODGL/etc/clins/$1" ];then
   cerr "Error!, Execute 'show prompts'"
else
source $PODGL/etc/clins/$1
fi
}
sps(){
  cin(){
     printf "${white}┌──[${URed}DIGLE$white]──[$red$(printf $VICTIM | sed s/" "//g)$white]─[$red$PORT$white]\n$white▼$white\n$green"
     read -e $1
     printf "$blgreen↓$white\n"
  }
}
say(){
  espeak -v en-us "\"$@\""
}

cout(){
  printf "$white[$BBlue+$white] %s\n" "$*"
}
cerr(){
  printf "$white[$BRed-$white] %s\n" "$*"
}
notify(){
  printf "$white[$BGreen*$white] %s\n" "$*"
}
warn(){
  printf "$white[$BRed!$white] %s\n" "$*"
}
inform(){
  printf "$white[${BYellow}i$white] %s\n" "$*"
}

unknown(){
  printf "$white[${BPurple}?$white] %s\n" "$*"
}
random(){
  if [ "$1" == "prompt" ];then
     source $PODGL/etc/clins/$(expr $RANDOM % 10)
  fi
}
enable(){
   export ${1^^}=1 2>/dev/null
}
disable(){
   export ${1^^}=0 2>/dev/null
}
