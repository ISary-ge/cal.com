mkdir -p /root/.ssh
echo $1 | base64 -d > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa