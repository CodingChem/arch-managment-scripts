#!/bin/bash
# A script to update files on ansible configuration

# Copy ssh public key
cp ~/.shh/id_ed25519.pub ~/ansible-configurations/roles/base/files/users/vegard/ssh/id_ed25519.pub

