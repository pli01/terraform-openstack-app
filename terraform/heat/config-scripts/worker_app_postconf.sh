#!/bin/bash
echo "# RUNNING: $(dirname $0)/$(basename $0)"
set -xe -o pipefail
libdir=/home/debian
[ -f ${libdir}/config.cfg ] && source ${libdir}/config.cfg
[ -f ${libdir}/common_functions.sh ] && source ${libdir}/common_functions.sh
[ -f ${libdir}/app.cfg ] && source ${libdir}/app.cfg

echo "## app configuration"
su - debian <<EOF
set -x
export no_proxy=$no_proxy
export http_proxy=$internal_http_proxy
export https_proxy=$internal_http_proxy

export DOCKERHUB_LOGIN="$dockerhub_login"
export DOCKERHUB_TOKEN="$dockerhub_token"

export GITHUB_TOKEN="$github_token"
export DOCKER_REGISTRY_USERNAME="$docker_registry_username"
export DOCKER_REGISTRY_TOKEN="$docker_registry_token"
export APP_INSTALL_SCRIPT="$app_install_script"

(
curl -kL -s -H "Authorization: token \${GITHUB_TOKEN}" \${APP_INSTALL_SCRIPT} | \
 bash
) || exit \$?
EOF

echo "## End post installation"
