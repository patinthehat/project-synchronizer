#!/bin/bash
 
#This file is automatically called from the Makefile

CONFIG_HEADER="config"

function clean() { 
  rm -f 'build/*' >/dev/null
}


#configure must be run prior to this file being run.
if [ ! -f $CONFIG_HEADER ]; then
    echo "Error: No config file found.  Please run ./configure first."
    exit -1
fi 

#make sure the build directory exists
if [ ! -d build ]; then
  mkdir build
fi 

clean

#copy templates to the build directory and rename
#TODO: use find/locate instead of listing each file individually
cp src/template.project-sync-to-remotehost build/project-sync-to-remotehost
cp src/template.projectsync-project build/projectsync-project


#remove the config file include with the actual contents, so one less file
#is required for the compiled project to work.


echo "Replacing included configuration files with contents."

CONFIG_CONTENTS=`cat $CONFIG_HEADER | awk '{ gsub(/"/, "\\"") ; print }'`
rrep -qs -e "source \"../$CONFIG_HEADER\"" "$CONFIG_CONTENTS" build/project-sync-to-remotehost
rrep -qs -e "source \"../$CONFIG_HEADER\"" "$CONFIG_CONTENTS" build/projectsync-project


echo "Copy the files in build to your main project folder.  Then, create a symbolic link 
named 'project-sync-[project-directory-name]' that is linked to the script 'projectsync-project'. 
Now calling your symbolic link script will use rsync to synchronize the project folder to the target 
folder on the remote host.  Useful for having a backup copy  of a project, or copying it over to a host 
running apache (if it's a website)."
