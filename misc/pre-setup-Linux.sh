echo "Setting up Linux"

DISTRIBUTION=$(lsb_release -ds)

if [ "${DISTRIBUTION}" = '"Garuda Linux"' ] ; then
  echo "Installing Openssh"
  sudo pacman -S --noconfirm --needed openssh 2>&1 |  sed 's/^/\t/g'
  source "$HOME_CONFIG/misc/systemctl.sh" sshd 

  source "$HOME_CONFIG/misc/setup-ansible.sh"
fi
