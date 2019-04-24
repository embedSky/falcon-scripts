#!/bin/bash

# export scripts=$PWD
# cd $scripts && bash cmd.sh stop && svn update && cd $scripts && cd $scripts && bash cmd.sh start

# 日志保存路径
#LOG_DIR=/bgi/logs/open-falcon
#自定义日志文件路径
LOG_DIR=$HOME/logs/open-falcon
mkdir -p $LOG_DIR

# 采集脚本列表
#scripts=(du.sh proc.sh)
#本例只获取进程信息
scripts=(proc.sh)

function start(){
    arr=$@
    if [ "$arr" == "" ];then
        arr=${scripts[@]}
    fi

    for sh in ${arr[@]};do
        echo start $sh
        nohup bash $sh $LOG_DIR >${LOG_DIR}/$sh.out 2>&1 &
        sleep 1
    done
}

function stop(){
    arr=$@
    if [ "$arr" == "" ];then
        arr=${scripts[@]}
    fi

    # echo ${arr[@]}
    for sh in ${arr[@]};do
        pids=$(ps -aux|grep -v grep|grep -v cmd.sh|grep "$sh"|awk '{print $2}'|tr -s '\n' ' ')
        echo stop $sh $pids
        kill -9 $pids
    done
}

function status(){
    arr=$@
    if [ "$arr" == "" ];then
        arr=${scripts[@]}
    fi

    # echo ${arr[@]}
    for sh in ${arr[@]};do
        pids=$(ps -aux|grep -v grep|grep -v cmd.sh|grep "$sh"|awk '{print $2}'|tr -s '\n' ' ')
        echo status $sh $pids
    done
}

$@