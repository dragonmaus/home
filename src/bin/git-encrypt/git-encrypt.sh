#!/bin/sh
localuser=`cat "$HOME"/.secret/signing.key`
recipient=`cat "$HOME"/.secret/encryption.key`
exec gpg2 --batch --compress-algo none --encrypt --local-user $localuser --no-encrypt-to --quiet --recipient $recipient --sign --use-agent --yes
