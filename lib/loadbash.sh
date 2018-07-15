#!/bin/bash

source $HOME/ltz/lib/loaddocs.sh

function bash-folders ()
{
    cd $HOME 
    if [ ! -d $Name ]
    then 
        mkdir $Name
        cd $Name
        mkdir test
        mkdir bin
        mkdir lib
        changelog
        readme
        bash-gitignore
        mkdir doc 
        cd doc 
        intro
    else 
        echo "ERROR: Project folder \"$Name\" already exists. Delete the existing folder or make a new Project under a different name"
    fi
}

function bash-gitignore ()
{
    echo "#Ingore Mac Specific Files
        .DS_Store" > .gitignore
}

