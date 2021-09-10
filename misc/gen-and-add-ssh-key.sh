echo "Ensuring ssh key exists"
ANSIBLE_SSH_KEY="$HOME/.ssh/ansible-self"
if test -f "$ANSIBLE_SSH_KEY"
then
  echo -e "\tKey already exists"
else
  # this will create a new key
  ssh-keygen -f "$ANSIBLE_SSH_KEY" -N "" -q
  echo -e "\tCreated a new ssh key at $ANSIBLE_SSH_KEY"
fi

echo "Adding SSH key to authorized_keys if does not exists"
touch ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys | grep "$(cat $ANSIBLE_SSH_KEY.pub )" > /dev/null
if [ "$?" = '0' ]
then
  echo -e "\tKey is already Added"
else
  cat "$ANSIBLE_SSH_KEY.pub" >> "$HOME/.ssh/authorized_keys"
  echo -e "\tAdded $ANSIBLE_SSH_KEY"
fi




