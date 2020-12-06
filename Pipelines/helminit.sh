#!/usr/bin/env bash
export HELM_VERSION="3.4.1"
curl -LO "https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz"
mkdir -p "/usr/local/helm-v$HELM_VERSION"
tar -xzf "helm-v$HELM_VERSION-linux-amd64.tar.gz" -C "/usr/local/helm-v$HELM_VERSION"
ln -sf "/usr/local/helm-v$HELM_VERSION/linux-amd64/helm" /usr/local/bin/helm 
ln -sf "/usr/local/helm-v$HELM_VERSION/linux-amd64/helm" /usr/local/bin/helm3
rm -f "helm-v$HELM_VERSION-linux-amd64.tar.gz"
gcloud container clusters get-credentials "coa" --region=europe-west3