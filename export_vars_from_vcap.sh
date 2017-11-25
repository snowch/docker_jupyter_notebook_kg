#!/bin/bash

export VCAP_STR="$(cat vcap.json)"

export KG_HTTP_USER=$(python -c "import json, os; print(json.loads(os.environ['VCAP_STR'])['cluster']['user'])")
export KG_HTTP_PASS=$(python -c "import json, os; print(json.loads(os.environ['VCAP_STR'])['cluster']['password'])")
export KG_HTTP_URL=$(python -c "import json, os; print(json.loads(os.environ['VCAP_STR'])['cluster']['service_endpoints']['notebook_gateway'])")
export KG_WS_URL=$(python -c "import json, os; print(json.loads(os.environ['VCAP_STR'])['cluster']['service_endpoints']['notebook_gateway_websocket'])")

