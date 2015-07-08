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

path and command search order:
1. absolute path or relative path
2. alias
3. search buildin
4. find in $PATH

login message:
/etc/issue (tty1~6 welcome message)
/etc/motd (tips after login)

login shell load for bash:
/etc/profile
PATH
MAIL
USER
HOSTNAME
HISTSIZE
/etc/inputrc -- input setting
/etc/profile.d/*.sh -- some sh to set enviorment and alias
~/.bash_profile
~/.bashrc

non-login shell:
~/.bashrc

load VAR in file:
source ~/.bashrc or . ~/.bashrc

~/.bash_history
~/.bash_logout

tty VAR:


wildcard:
*  : 0 - INF ch
?  : 1 ch
[] : [abcd] means must has a ch in (a,b,c,d)
[-]: [0-9],[a-z]
[^]: [^abcd] means must has a ch not in (a,b,c,d)

special ch:
1 : pipe
> : data stream redirect/output
>>: like >,not replace but append
< : date stream redirect/input
<<: like <
# : comment
; : contionous command

data stream redirect:
ll / > ~/rootfile #write (ll /) into rootfile
ll /homexx 2> ~/homefileerror #write error mesage to homefileerror(dir not exist)
find /home -name .bashrc > list_right 2> list_error #write right and error

/dev/null: ignore the message
find /home -name .bashrc > list 2>&1 #write right and error into same file
find /home -name .bashrc &> list    #same as last

cat > catfile #accept the user input
cat > catfile < ~/.bashrc #use file for user input

cat > catfile << EOF #when type EOF, the input will be over.


judgement of command execute: ; && ||
;
&& : (a&&b : (exec(a) == 0 then exec b)
|| : (a||b : (exec(a) != 0 then exec b)
correct execute result is 0.


**pipe**:
can only handle standard output message from prev command
cmd1 -xx | cmd2 
cmd2 must accept the standard output from cmd1

pipe command: selection
cut & grep
cut:
cut -d 'delm_char' -f fields
cut -c range_ch

example>
echo $PATH | cut -d ':' -f 3  #get no 3 path#
echo $PATH | cut -d ':' -f 3,5 #get no 3 and 5 path#
echo $PATH | cut -c 12- #get path begin at index 12#

grep:
-a : find data at bin as text
-c : get string count
-i : ignore case
-n : output line number
-v : reverse selection

last | grep -i 'root'
last | grep -i 'root'|cut -d ' ' -f 1

pipe command : sort
sort & wc & uniq

sort:
-f : ignore case
-b : trim left
-M : sort by Month
-n : in number order
-r : in desc order
-u : uniq line
-t : delimeter, default is [tab]
-k : sort field

cat /etc/passwd | sort -t ':' -f 3 | cut -d ':' -f 3

uniq:
-i : ignore case
-c : count

last | cut -d ' ' -f 1 | uniq -c

wc: get word count
-l : line count
-w : word count
-m : char count

cat cmduse.list | wc
last | wc -l
last | grep 'root' | wc -l

pipe command: double redirect
tee

tee:
-a : append to file
last | tee last.list | cut -d ' ' -f 1 #output to last.list and screen#

pipe command: charactor convert
tr & col & join & paste & expand

tr: delete or replace text
-d : delete string strX
-s : replace string match regexX to regexY

last | tr -d 'unknown'

col:
-x : convert [tab] to [space]
-b : do not output backspaces

join: join two file lines which has matched data
-t : delimeter char
-i : ignore case
-1 : field no in file1
-2 : field no in file2

join -t ':' -1 4 /etc/passwd -2 3 /etc/shadow

paste: concat two files in line
paste /etc/passwd /etc/shadow
cat /etc/passwd | paste /etc/passwd -

expand:
expand -t 6 /etc/man.config

split: split file
-b : size unit, b, k, m
-l : by line count
PREFIX: prefix

split -b 300k /etc/termcap termcap # split
cat termcap* >> termcap	#combine

xargs: make args for command from stdin

-: replace for stdout or stdin
tar -cvf - /home | tar xzvf - 

