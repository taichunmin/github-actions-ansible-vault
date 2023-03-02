# github-actions-ansible-vault

Ansible Vault for GitHub Actions.

## Inputs

### `command`

**Required** Command to execute. Default `ansible-vault --version`.

### `vault_key`

**Required** Your vault key. Default `''`.

## Example usage

```yaml
steps:
  - name: Retrieve runner uid and gid
    id: uid-gid
    run: |
      echo "uid=$(id -u)" >> $GITHUB_OUTPUT
      echo "gid=$(id -g)" >> $GITHUB_OUTPUT
  - name: decrypt files with ansible-vault
    uses: taichunmin/github-actions-ansible-vault@v1
    env:
      UID: ${{ steps.uid-gid.outputs.uid }}
      GID: ${{ steps.uid-gid.outputs.gid }}
    with:
      vault_key: ${{ secrets.vault_key }}
      command: |
        ansible-vault encrypt foo.yml
        chown $UID:$GID foo.yml
```