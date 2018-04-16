#!/bin/bash
#set -x
# Rename extensions to the same or other directory

dir1=$1
param=$2
ext1=$3
ext2=$4
dir2=$5

if [ -d "$dir1" ]; then

    for file in $dir1*.$ext1; do

        if [ -r "$file" ]; then

            fileName=$(basename $file .$ext1)

            if [ "$param" == "-m" ]; then

                echo "Changing file $dir1$fileName.$ext1 to $fileName.$ext2"
                mv $dir1$fileName.$ext1 $dir1$fileName.$ext2

            elif [ "$param" == "-c" ]; then

                if [ $# == 4 ]; then

                    echo "Renaming file $dir1$fileName.$ext1 to $dir1$fileName.$ext2"
                    cp $dir1$fileName.$ext1 $dir1$fileName.$ext2

                elif [ $# == 5 ]; then

                    echo "Copying and renaming file from $dir1$fileName.$ext1 to $dir2$fileName.$ext2"
                    cp $dir1$fileName.$ext1 $dir2$fileName.$ext2
                fi

            else echo "Not a valid command, try either -c or -m"
            fi

        else echo -e "\nuser $USER has no reading permission for file $file \n"
        fi

    done

else echo "$dir1 doesn't exist!"

fi
