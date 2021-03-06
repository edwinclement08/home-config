echo "Setting up Linux"

DISTRIBUTION=$(lsb_release -is)

if [ "${DISTRIBUTION}" = 'Garuda' ] ; then
  echo "Installing Openssh"
  sudo pacman -S --noconfirm --needed openssh 2>&1 |  sed 's/^/\t/g'
elif [ "${DISTRIBUTION}" = 'Debian' ] ; then
  # Needed as Ubuntu & Debian don't include this by default
  sudo apt-get install -y python3-venv curl |  sed 's/^/\t/g'
elif [ "${DISTRIBUTION}" = 'Ubuntu' ] ; then
  sudo apt-get install -y python3-venv curl |  sed 's/^/\t/g'
fi

echo "Ensuring sshd is up and running"
source "$HOME_CONFIG/misc/systemctl.sh" sshd |  sed 's/^/\t/g'

echo "Generating SSH Key(if not exists) & adding to authorized"
source "$HOME_CONFIG/misc/gen-and-add-ssh-key.sh" | sed 's/^/\t/g'

echo "Installing Ansible"
source "$HOME_CONFIG/misc/setup-ansible.sh" | sed 's/^/\t/g'

