apt-get update
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
usermod -a -G docker ubuntu
sed -i 's$fd://$fd:// -H tcp://0.0.0.0:2376$g' /lib/systemd/system/docker.service
systemctl daemon-reload
service docker restart
apt-get clean
