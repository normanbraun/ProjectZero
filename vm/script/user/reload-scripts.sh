#!/bin/bash

source /vm/script/bash/util/console.sh

# ----------------------------------------------------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------------------------------------------------

function copy_all_scripts_to_user_bin_folder
{
    local srcDir="/vm/script/user";
    local dstDir="/usr/local/bin";

    for file in $(ls ${srcDir} -1); do

        local srcFile=${srcDir}/${file};
        local dstFile=`echo ${dstDir}/${file} | sed -r 's/.sh//g'`; # Cut ".sh" from file name

        printf "Copy ${CONSOLE_COLOR_CYAN}${srcFile}${CONSOLE_COLOR_NONE} to ${CONSOLE_COLOR_CYAN}${dstFile}${CONSOLE_COLOR_NONE}\n";
        sudo cp ${srcFile} ${dstFile};
        sudo chmod +x ${dstFile};
    done
}

# ----------------------------------------------------------------------------------------------------------------------
# Script
# ----------------------------------------------------------------------------------------------------------------------

copy_all_scripts_to_user_bin_folder;
