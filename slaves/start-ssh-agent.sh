#!/bin/sh
eval $(ssh-agent -s)
ssh-add /var/jenkins_home/.ssh/id_ed25519
