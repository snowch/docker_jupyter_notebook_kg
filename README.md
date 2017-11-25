README

Build this docker image:

```bash
docker build . -t jupyter-nb-iae
```

Run the docker container with:

```bash

# If you want to read the environment variables from a vcap_json run the command below
source export_vars_from_vcap.sh

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
