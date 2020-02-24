#!/bin/bash
su - vagrant <<'EOF'
IP=192.168.100.10
ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ''
echo -e "Host *\n  StrictHostKeyChecking no" > ~/.ssh/config
sudo apt-get update
sudo apt-get install sshpass -y
cat /home/vagrant/.ssh/id_rsa.pub | sshpass -p 'vagrant' ssh $IP 'cat >> /home/vagrant/.ssh/authorized_keys'
scp ${IP}:/home/vagrant/.ssh/id_rsa.pub /tmp
cat /tmp/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
EOF
