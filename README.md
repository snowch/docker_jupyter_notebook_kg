README
------

Clone this repository:

```bash
https://github.com/snowch/docker_jupyter_notebook_kg.git
cd docker_jupyter_notebook_kg
```


Build this docker image:

```bash
docker build . -t jupyter-nb-iae
```

Run the docker container with:

```bash

# If you want to read the environment variables from an IBM Analytics Engine vcap.json: 
#  1. copy your vcap.json to this folder
#  2. run the command below parse the vcap.json and export the required environment variables

source export_vars_from_vcap.sh

# The local port to bind the notebook to

NB_PORT=8889

docker run -it --rm \
	-e KG_HTTP_USER=$KG_HTTP_USER \
	-e KG_HTTP_PASS=$KG_HTTP_PASS \
	-e KG_URL=$KG_HTTP_URL \
	-e KG_WS_URL=$KG_WS_URL \
	-e NB_PORT=$NB_PORT \
	-p $NB_PORT:$NB_PORT \
	jupyter-nb-iae
```

Open the brower with the url output from above
