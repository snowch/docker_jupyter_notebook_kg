#!/bin/bash

set -e

cd /home/jovyan/work

. /usr/local/bin/start.sh jupyter notebook --debug \
     --no-browser \
     --port=$NB_PORT \
     --NotebookApp.ip=0.0.0.0 \
     --NotebookApp.session_manager_class=nb2kg.managers.SessionManager \
     --NotebookApp.kernel_manager_class=nb2kg.managers.RemoteKernelManager \
     --NotebookApp.kernel_spec_manager_class=nb2kg.managers.RemoteKernelSpecManager 2>&1
