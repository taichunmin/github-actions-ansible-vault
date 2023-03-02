#!/bin/sh -l
set -e
echo $INPUT_VAULT_KEY > $ANSIBLE_VAULT_PASSWORD_FILE
INPUT_VAULT_KEY='************'
sh -c "$INPUT_COMMAND"