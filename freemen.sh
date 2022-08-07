#!/bin/bash
echo "memory usage:"
free -h
su <<EOF
letmethink0
sync;echo 3>/proc/sys/vm/drop_caches
echo "memory cleaned..."
exit
EOF
echo "after cleaned..."
free -h
