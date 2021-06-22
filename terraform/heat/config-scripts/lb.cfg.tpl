#!/bin/bash
# generated terraform template file
# place here all variables
cat <<EOF >/home/debian/lb.cfg
%{ if dockerhub_login != "" ~}
export dockerhub_login="${dockerhub_login}"
%{ endif ~}
%{ if dockerhub_token != "" ~}
export dockerhub_token="${dockerhub_token}"
%{ endif ~}
%{ if github_token != "" ~}
export github_token="${github_token}"
%{ endif ~}
%{ if docker_registry_username != "" ~}
export docker_registry_username="${docker_registry_username}"
%{ endif ~}
%{ if docker_registry_token != "" ~}
export docker_registry_token="${docker_registry_token}"
%{ endif ~}
%{ if lb_install_script != "" ~}
export lb_install_script="${lb_install_script}"
%{ endif ~}
%{for k,v in lb_variables~}
%{ if v != "" ~}
export ${k}="${v}"
%{ else ~}
export ${k}=""
%{ endif ~}
%{endfor~}
%{ if metric_enable != "" ~}
export metric_enable="${metric_enable}"
%{ endif ~}
%{ if metric_install_script != "" ~}
export metric_install_script="${metric_install_script}"
%{ endif ~}
%{for k,v in metric_variables~}
%{ if v != "" ~}
export ${k}="${v}"
%{ else ~}
export ${k}=""
%{ endif ~}
%{endfor~}
#
EOF
