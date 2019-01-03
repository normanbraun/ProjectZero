#!/bin/bash

print_green "Copy user shell scripts ...";
source /vm/script/user/reload-scripts.sh

print_green "Restart services ...";
source /vm/script/user/restart-webserver.sh
