shell:
shell to kernal
sh, C Shell, K Shell, TCSH
bash is an enhanced sh
/etc/shells

/etc/passwd store the default shell of logined user
uis:x:0:0:root:/home/louis:/bin/bash
loui:x:1000:1001:louis:/home/loui:/bin/bash

~/.bash_history store the command history

press [tab] once to complete the command, twice to get all posible commands

job control
foreground
background

shell script

variable:
set: myname=louis
show: echo $myname
unset: unset myname

myname="louis owen"
dowhat="driving a car"
aboutme="$myname am $dowhat"
echo $aboutme
exp: this $variable in the quote string remain its meaning

version=`uname -r`
version=$(uname -r)
versionex="`uname -r`.ex"
exp: can use `` and $() get the result of command.

export MYPATH
exp: export variable to child process

env: list all enviorment variables
set: list all enviorment and customerize variables

VAR PS1:
the prompt setting

read,declare,array
declare -a MAOPAO
MAOPAO[1]=1
MAOPAO[2]=3
MAOPAO[3]=2
echo ${MAOPAO[3]}

delete,replace VAR

delete:
from begin to end:
${variable#want_delete_shortest_part}
${variable##want_delete_longest_part}
from end to begin:
${variable%want_delete_shortest_part}
${variable%%want_delete_longest_part}

replace:
echo ${PATH/sbin/SBIN}  #just first
echo ${PATH//sbin/SBIN} #replace all 

new_var=${old_var-content}
username=${username-root}
echo $username #if username is not existed,username replaced by root#
username=louis
username=${username-root}
echo $username #username is existed, empty,show louis#

new_var=$(old_var:-content}


