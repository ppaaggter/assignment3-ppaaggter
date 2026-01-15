#!/bin/bash
#
# filesdir=$1
# searchstr=$2
#
# if [ $# -ne 2 ]
# then
#
#     echo "The parameters are not specified"
#     exit 1
# fi
#
#
#
# if [ ! -d $filesdir ]
# then
#     echo "The directoy doesn't exist"
#     exit 1
# fi
#
#
# cont=0
# cont2=0
# aux=0
#
# archivos=$(find $filesdir)
#
# for archivo in $archivos
# do
#
#
#     if [ -e $archivo -a ! -d $archivo ]
#     then
#         aux=$(cat $archivo |grep -c $searchstr)
#         cont2=$((cont2+1))
#     fi
#
#     cont=$((cont+aux))
# done
#
#
#
# echo "The number of files are ${cont2} and the number of matching lines are ${cont}"

filesdir=$1
searchstr=$2

WRITER_APP=./writer

if [ $# -ne 2 ]
then
    echo "The parameters are not specified"
    exit 1
fi

if [ ! -d "$filesdir" ]
then
    echo "The directory doesn't exist"
    exit 1
fi

# Clean previous build artifacts
make clean

# Build writer using native compilation
make

echo " "
echo " "

# Verify writer exists
if [ ! -x "$WRITER_APP" ]
then
    echo "writer application was not built"
    exit 1
fi

cont=0
cont2=0

files=$(find "$filesdir" -type f)

for file in $files
do
    matches=$(grep -c "$searchstr" "$file")
    cont=$((cont + matches))
    cont2=$((cont2 + 1))
done

echo "The number of files are ${cont2} and the number of matching lines are ${cont}"
