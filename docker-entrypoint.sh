#!/bin/bash

# check if the `server.xml` file has been changed since the creation of this
# Docker image. If the file has been changed the entrypoint script will not
# perform modifications to the configuration file.

# 查看文件最近修改的Unix时间戳（从计算机纪元时间到最近一次修改的秒数）
# https://www.cnblogs.com/Jack47/p/unix-time-date-episode.html

if [ "$(stat -c "%Y" "${JIRA_INSTALL}/conf/server.xml")" -eq "0" ]; then
  if [ -n "${X_PROXY_NAME}" ]; then
    xmlstarlet ed --inplace --pf --ps --insert '//Connector[@port="8080"]' --type "attr" --name "proxyName" --value "${X_PROXY_NAME}" "${JIRA_INSTALL}/conf/server.xml"
  fi
  if [ -n "${X_PROXY_PORT}" ]; then
    xmlstarlet ed --inplace --pf --ps --insert '//Connector[@port="8080"]' --type "attr" --name "proxyPort" --value "${X_PROXY_PORT}" "${JIRA_INSTALL}/conf/server.xml"
  fi
  if [ -n "${X_PROXY_SCHEME}" ]; then
    xmlstarlet ed --inplace --pf --ps --insert '//Connector[@port="8080"]' --type "attr" --name "scheme" --value "${X_PROXY_SCHEME}" "${JIRA_INSTALL}/conf/server.xml"
  fi
  if [ -n "${X_PATH}" ]; then
    xmlstarlet ed --inplace --pf --ps --update '//Context/@path' --value "${X_PATH}" "${JIRA_INSTALL}/conf/server.xml"
  fi
fi

exec "$@"
