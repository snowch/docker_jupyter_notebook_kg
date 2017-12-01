# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/minimal-notebook:fa77fe99579b

# Do the pip installs as the unprivileged notebook user
USER jovyan

RUN pip install --upgrade pip && \
    pip install ipywidgets==7.0 && \
    pip install "git+https://github.com/snowch/kernel_gateway_demos.git#egg=nb2kg&subdirectory=nb2kg" && \
    start.sh jupyter serverextension enable --py nb2kg --sys-prefix && \
    start.sh jupyter nbextension enable --py widgetsnbextension --sys-prefix 

ADD run_script.sh /home/jovyan/run_script.sh

WORKDIR "/home/jovyan"

CMD [ "/bin/bash", "run_script.sh" ]
