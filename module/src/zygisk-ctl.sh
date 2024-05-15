MODDIR=${0%/*}/..

export TMP_PATH=/sbin
[ -d /sbin ] || export TMP_PATH="$(cat $MODDIR/rand)"

exec $MODDIR/bin/zygisk-ptrace64 ctl $*
