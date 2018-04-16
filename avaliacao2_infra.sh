#!/bin/bash
#set -x
# Rename extensions to the same or other directory

dir1=$1
param=$2
ext1=$3
ext2=$4
dir2=$5

if [ -d "$dir1" ]; then
# check whether directory $dir1 exists

    for file in $dir1*.$ext1; do
    # iterate over files in directory $dir1 with given extension $ext1

        if [ -r "$file" ]; then
        # check whether user has reading permission over the file

            fileName=$(basename $file .$ext1)
            # retrieve only the file name (without the path or the extension)

            if [ "$param" == "-m" ]; then
            # check whether mv operation

                echo "Changing file $dir1$fileName.$ext1 to $fileName.$ext2"
                mv $dir1$fileName.$ext1 $dir1$fileName.$ext2

            elif [ "$param" == "-c" ]; then
            # check whether cp operation

                if [ $# == 4 ]; then
                # checke whether rename in the same folder

                    echo "Renaming file $dir1$fileName.$ext1 to $dir1$fileName.$ext2"
                    cp $dir1$fileName.$ext1 $dir1$fileName.$ext2

                elif [ $# == 5 ]; then
                # check whether rename and copy to another fodler

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
