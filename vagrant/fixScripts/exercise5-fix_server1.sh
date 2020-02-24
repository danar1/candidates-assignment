#!/bin/bash

su - vagrant <<'EOF'
ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ''
echo -e "Host *\n  StrictHostKeyChecking no" > ~/.ssh/config
EOF
