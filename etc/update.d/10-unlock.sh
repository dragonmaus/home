pass show systems/logins/pad/dragon | sed -n 1p | sudo -Sv 2>/dev/null
env DISPLAY=${DISPLAY:-:0} SSH_ASKPASS=sshpass ssh-add </dev/null
