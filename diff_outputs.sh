#!/bin/bash

cd mul2_outputs

for dir in *; do
    echo
    echo ======   In $dir directory   ======
    cd $dir

    for file in *; do
        echo
        for i in ./*; do
            echo -- Diffing $file and $i --
            diff -q "$i" $file
        done
    done
    cd ..
    echo = = = = = = = = = = = = = = = = = = = = = = = = = =
done
