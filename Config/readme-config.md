## Managed SSL certificates
https://cloud.google.com/kubernetes-engine/docs/how-to/managed-certs


## Creating a watch with XRAY REST API

export ART_USER="saar"
export ART_API_KEY="You0i0n't4hink1dPutrealAPIKeys?!?=="
export BASEURL="https://saar.jfrog.io"

curl -u ${ART_USER}:${ART_API_KEY} -X POST -H "Content-Type: application/json" --data "@./medium-watch.json" ${BASEURL}/xray/api/v2/watches