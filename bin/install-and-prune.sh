#!/bin/bash

HMWRK=$(pwd)
cd src
for dir in */; do
    cd $HMWRK/src/$dir
    lamdadir="$(basename "${dir}")"
    npm install --production=true &> ../../out/$1.package.install.out
    npm prune --production=true &> ../../out/$1.package.prune.out
    zip -r "../../dist/${1}/src/${lamdadir}.zip" * -x package* -x coverage\* -x tests\* @ &> ../../out/$1.package.zip.out
    
    echo "*******************"
    echo $(pwd)
    echo "*******************"
    echo $dir
    # mkdir $HMWRK/dist/${1}/src/$dir
    # TREE=$HMWRK/dist/${1}/src/$dir
    # STAGE=$HMWRK/dist/${1}/stage
    # TRIMMER=$(echo $TREE | sed 's:/*$::')
    # cd $TREE
    # 7z a -r $TRIMMER.zip
    # cd ..
    # cp *.zip $STAGE
    # # rm *.*
    # # rm -rf $TREE
    cd ..
    cd ..
done
exit 0