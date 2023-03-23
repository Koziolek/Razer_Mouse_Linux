#!/bin/sh
# shellcheck disable=SC2046
# shellcheck disable=SC2009
if [ "$(id -u)" -ne 0 ];then
	if [ $# -eq 0 ]; then
		kill $(pgrep -f "naga serviceHelper") > /dev/null 2>&1
		if [ "$(pgrep -f "naga serviceHelper" -G 0 -c)" -ne 0 ]; then
			pkexec --user root kill $(pgrep -f "naga serviceHelper" -G 0)
		fi
	else
		kill $(pgrep -f "naga serviceHelper" | grep -v "$1") > /dev/null 2>&1
		if [ "$(pgrep -f "naga serviceHelper" -G 0 | grep -v "$1" -c)" -ne 0 ]; then
			pkexec --user root kill $(pgrep -f "naga serviceHelper" -G 0 | grep -v "$1")
		fi
	fi	
else
	if [ $# -eq 0 ]; then
		kill $(ps aux | grep "naga serviceHelper" | grep -v root | grep -v grep | awk '{print $2}') > /dev/null 2>&1
		if [ "$(pgrep -f "naga serviceHelper" -G 0 -c)" -ne 0 ]; then
			kill $(pgrep -f "naga serviceHelper" -G 0)
		fi
	else
		kill $(ps aux | grep "naga serviceHelper" | grep -v root | grep -v "$1" | grep -v grep | awk '{print $2}') > /dev/null 2>&1
		if [ "$(pgrep -f "naga serviceHelper" -G 0 | grep -v "$1" -c)" -ne 0 ]; then
			kill $(pgrep -f "naga serviceHelper" -G 0 | grep -v "$1")
		fi
	fi
fi
