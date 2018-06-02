pass show systems/logins/pad/dragon | sed -n 1p | sudo -Sv 2>/dev/null
env SSH_ASKPASS=sshpass ssh-add </dev/null
