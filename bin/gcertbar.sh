#!/bin/bash

gcertstatus --format=statusbar --check_ssh=0 2>/dev/null
ok=$status
if [ ! $ok ]; then echo "no"; fi
echo
if [ ! $ok ]; then echo "error"; else echo; fi
