#!/bin/bash

filesdir=$1
searchstr=$2

if [$# -ne 2]
then

    echo "The parameters are not specified"
    exit 1
fi


if [-d $filesdir]
then
    echo "The directoy doesn't exist"
    exit 1
fi

trap echo "" EXIT

archivos=$(find $filesdir)

coincidencias=$(cat $archivos |grep -c $searchstr)


echo "The number of files are ${#archivos[@]} and the number of matching lines are ${coincidencias}"

