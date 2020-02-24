#!/bin/bash

NUM_ARGS=$#
TOTAL_FILES_SIZE=0
COUNT=1
FILES=''

while [ "$COUNT" -lt "$NUM_ARGS" ]; do
    TOTAL_FILES_SIZE=$(( $TOTAL_FILES_SIZE + `du -b $1 | awk '{print $1}'` ))
    FILES+="$1 "
    shift
    COUNT=$(( $COUNT + 1 ))
done

case `hostname` in
    server1)
        SERVER=192.168.100.11
        ;;
    server2)
        SERVER=192.168.100.10
        ;;
esac
if [[ ${USER} == "root" ]]; then
    su -c "scp $FILES ${SERVER}:${1}" - vagrant
else
    scp $FILES ${SERVER}:${1}
fi
echo $TOTAL_FILES_SIZE
