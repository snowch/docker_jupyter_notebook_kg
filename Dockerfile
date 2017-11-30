# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/minimal-notebook:fa77fe99579b

# Do the pip installs as the unprivileged notebook user
USER jovyan

# Upgrade pip
RUN pip install --upgrade pip

# TODO make all the following RUN commands happen together to keep the image size down

# Install dashboard layout and preview within Jupyter Notebook
RUN pip install ipywidgets==7.0

# FIXME: the community code does not work.  Apply line by line each change until the issue is resolved.
#RUN pip install "git+https://github.com/jupyter/kernel_gateway_demos.git#egg=nb2kg&subdirectory=nb2kg"
RUN pip install http://ibm-open-platform.ibm.com:8080/packages/nb2kg-0.0.1+ibm.6.tar.gz#md5=f368faef5cf7230760bda4e16a3a3018

RUN start.sh jupyter serverextension enable --py nb2kg --sys-prefix 
RUN start.sh jupyter nbextension enable --py widgetsnbextension --sys-prefix 

ADD run_script.sh /home/jovyan/run_script.sh

WORKDIR "/home/jovyan"

CMD [ "/bin/bash", "run_script.sh" ]
