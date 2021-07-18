#!/bin/sh

# Warn the user what's about to happen
echo About to update GPG key: if this hangs, you probably
echo need to forward gpg-agent to the host machine and try
echo again.
echo

# Set the gpg key to ultimate trust
echo -e "trust\n5\ny\n" | gpg --no-tty --command-fd 0 --edit-key 3A4F4DDB524D2FA60936EEBA8EF9982800E3B9F8 >/dev/null 2>&1
gpg --list-keys
echo

# Use the delegated ssh agent
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
ssh-add -L
echo

alias vc='veracrypt -t -k "" --pim=0 --protect-hidden=no -m nokernelcrypto /volume /mnt'
alias
echo
