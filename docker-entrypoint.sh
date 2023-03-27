#!/bin/sh
#set -x
userid=$(id -u)
if [ ${userid} != 0 ]; then
        echo "因权限问题不支持--user方式,请选用VUID变量."
        echo "Due to permission issues, the --user method is not supported. Please use the VUID variable."
        exit 404
fi
# allow the container to be started with `--user`
if [ ${VUID} != "" ]; then
        chown -R ${VUID} /data
        exec /usr/local/bin/gosu ${VUID} /usr/bin/verysync -no-browser -home /data/.config -gui-address :${PORT}

else
        exec /usr/bin/verysync -no-browser -home /data/.config -gui-address :${PORT}
fi

exec "$@"
