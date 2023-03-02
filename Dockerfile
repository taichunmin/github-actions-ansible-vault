FROM alpine:latest
ENV ANSIBLE_VAULT_PASSWORD_FILE='/.vault_key' INPUT_COMMAND='ansible-vault --version' INPUT_VAULT_KEY=''
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
RUN set -ex; \
  chmod +x /entrypoint.sh; \
  apk add --no-cache ansible-core