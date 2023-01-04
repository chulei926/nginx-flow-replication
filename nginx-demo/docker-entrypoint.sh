#!/bin/sh
# -------------------------------
set -e
# -------------------------------
cur_env=${DEPLOY_ENV}

if [ -z $cur_env ];then
  echo "[WARN]: Current deploy environment not exists, set default value: test"
  cur_env="test"
else
  echo "[INFO]: Current deploy environment is $cur_env"
fi


if [[ ${cur_env} == "prod" ]]
then
  echo "[INFO]: Current deploy environment is prod, start nginx ......"
else
  echo '[INFO]: Current deploy environment is not prod, start replacing variables......'
  sed -i '/mirror/d' /etc/nginx/nginx.conf
fi
nginx_cmd=$(which nginx)
# -------------------------------
echo "[INFO]: start exec command:${nginx_cmd} -g 'daemon off;'"
exec ${nginx_cmd} -g 'daemon off;'
# EOF