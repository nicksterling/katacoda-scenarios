echo "Launching Kubernetes"

launch.sh

echo "Loading Dependencies"
curl -JLO https://github.com/derailed/k9s/releases/download/v0.23.10/k9s_Linux_x86_64.tar.gz
tar xvzf k9s_Linux_x86_64.tar.gz
mv k9s /usr/bin