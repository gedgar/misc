#!/usr/bin/env bash
vtpids=$(pgrep -fli 'vtdataroot|mysqld')
if [ -n "$vtpids" ]; then
    while read -r pid process; do 
        echo Killing "$process ($pid)" && kill -9 "$pid"
    done <<<"$vtpids"
fi
if [[ -d /home/gary/vtdataroot ]]; then
    echo Removing /home/gary/vtdataroot && rm -rf /home/gary/vtdataroot
fi
