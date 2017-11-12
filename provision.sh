apt-get update
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
# apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
usermod -a -G docker vagrant
mkdir -p /etc/docker
echo '{"hosts": ["unix:///var/run/docker.sock", "tcp://0.0.0.0:2376"]}' > /etc/docker/daemon.json
service docker restart

sudo apt-get clean