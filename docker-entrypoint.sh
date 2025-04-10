#!/bin/sh
# set -x
userid=$(id -u)
if [ ${userid} != 0 ]; then
        echo "因权限问题不支持--user方式,请选用VUID变量."
        echo "Due to permission issues, the --user method is not supported. Please use the VUID variable."
        exit 1
fi
if [ ${VUID} != "" ]; then
  if [ -f "/usr/local/bin/gosu" ];then
        chown -R ${VUID} /data
        exec /usr/local/bin/gosu ${VUID} /usr/bin/verysync/verysync -no-browser -home /data/.config -gui-address :${PORT}
  else
        echo "受限于gosu的支持,对于非 arm64/amd64/armv7 的CPU使用docker默认用户运行"
        exec /usr/bin/verysync/verysync -no-browser -home /data/.config -gui-address :${PORT}
  fi
else
        exec /usr/bin/verysync/verysync -no-browser -home /data/.config -gui-address :${PORT}
fi
exec "$@"