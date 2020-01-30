#!/bin/bash

########################################################
# Determine OS platform
########################################################

UNAME=$(uname | tr "[:upper:]" "[:lower:]")
PYCMD=$(cat <<-EOM
	import platform
	for i in zip(['system','node','release','version','machine','processor'],platform.uname()):print i[0],':',i[1]
EOM
)

if [[ $UNAME =~ linux|darwin ]]; then
    if $(type -f python &> /dev/null); then
        export DISTRO="$(python -c "$PYCMD")"
    fi
fi

# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" == "" ] && export DISTRO=$UNAME
unset UNAME

echo "$DISTRO"

########################################################
# Examples
########################################################
## $ ~/os_detect.sh
## system : Darwin
## node : unagi
## release : 18.7.0
## version : Darwin Kernel Version 18.7.0: Tue Aug 20 16:57:14 PDT 2019; root:xnu-4903.271.2~2/RELEASE_X86_64
## machine : x86_64
## processor : i386
##
## $ ./os_detect.sh
## system : Linux
## node : ocp-app-01a.lab1.mydom.local
## release : 3.10.0-1062.1.1.el7.x86_64
## version : #1 SMP Tue Aug 13 18:39:59 UTC 2019
## machine : x86_64
## processor : x86_64


########################################################
# References
########################################################
# - https://unix.stackexchange.com/questions/92199/how-can-i-reliably-get-the-operating-systems-name/92218#92218
# - https://docs.python.org/2/library/platform.html
# - http://linuxmafia.com/faq/Admin/release-files.html
