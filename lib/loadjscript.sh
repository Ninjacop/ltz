#!/bin/bash

source $HOME/ltz/lib/loaddocs.sh

function jscript-folders ()
{
    cd $HOME 
    if [ ! -d $Name ]
    then 
        mkdir $Name
        cd $Name
        mkdir bin etc

        mkdir -p src/client/assets
        mkdir -p src/client/components
        mkdir -p src/client/providers
        mkdir -p src/client/views
        
        cd src/client 
        index-html 
        index-jscript
        router-jscript
        cd ...

        mkdir -p src/server

        cd src/server  
        mkdir plugins
        index-jscript

        cd plugins
        mkdir admin auth caching login metrics orm socketsd

        mkdir -p src/lib

        mkdir doc
        cd doc 
        intro $Name
        cd ..

        readme $Name
        changelog
        gpl3-license
        package-jscript
        npmignore-jscript
        gitignore-jscript
        
    else 
        echo "ERROR: Project folder \"$Name\" already exists. Delete the existing folder or make a new Project under a different name"
    fi

}

function index-html ()
{
    echo " " > index.html
}

function index-jscript ()
{
    echo " " > index.js
}

function router-jscript ()
{
    echo " " > router.js
}

function dockerignore-jscript ()
{
    echo "Dockerfile*
    README.md
    LICENSE
    .dockerignore
    .multi*" > .docketignore
}

function package-jscript ()
{
    echo "{
    \"name\": \"$Name\",
    \"version\": \"1.0.0\",
    \"description\": \"Node.js on Docker\",
    \"author\": \"$USER\",
    \"main\": \"src/client/index.js\",
    \"scripts\": {
        \"start\": \"node index.js\"
    },
    \"dependencies\": {
        \"express\": \"^4.16.1\"
    }
    }" > package.json
}

function npmignore-jscript ()
{
    echo ".*.swp
    ._*
    .DS_Store
    .git
    .hg
    .npmrc
    .lock-wscript
    .svn
    .wafpickle-*
    config.gypi
    CVS
    npm-debug.log" > .npmignore
}

function gitignore-jscript ()
{
    echo "# See http://help.github.com/ignore-files/ for more about ignoring files.

    # compiled output
    /dist
    /tmp
    /out-tsc

    # Runtime data
    pids
    *.pid
    *.seed
    *.pid.lock

    # Directory for instrumented libs generated by jscoverage/JSCover
    lib-cov

    # Coverage directory used by tools like istanbul
    coverage

    # nyc test coverage
    .nyc_output

    # Grunt intermediate storage (http://gruntjs.com/creating-plugins#storing-task-files)
    .grunt

    # Bower dependency directory (https://bower.io/)
    bower_components

    # node-waf configuration
    .lock-wscript

    # IDEs and editors
    .idea
    .project
    .classpath
    .c9/
    *.launch
    .settings/
    *.sublime-workspace

    # IDE - VSCode
    .vscode/*
    !.vscode/settings.json
    !.vscode/tasks.json
    !.vscode/launch.json
    !.vscode/extensions.json

    # misc
    .sass-cache
    connect.lock
    typings

    # Logs
    logs
    *.log
    npm-debug.log*
    yarn-debug.log*
    yarn-error.log*


    # Dependency directories
    node_modules/
    jspm_packages/

    # Optional npm cache directory
    .npm

    # Optional eslint cache
    .eslintcache

    # Optional REPL history
    .node_repl_history

    # Output of 'npm pack'
    *.tgz

    # Yarn Integrity file
    .yarn-integrity

    # dotenv environment variables file
    .env

    # next.js build output
    .next

    # Lerna
    lerna-debug.log

    # OS generated files 

    .DS_Store
    .DS_Store?
    ._*
    .Spotlight-V100
    .Trashes
    ehthumbs.db
    Thumbs.db" > .gitignore 
}