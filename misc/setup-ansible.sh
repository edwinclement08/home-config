which python3 1>/dev/null | sed 's/^/\t/g'
if [ $? -ne 0 ] 
then
  echo -e "\tPython3 is not installed, halting ansible install"
  exit 13
fi

VENV_PATH="$HOME_CONFIG/venv" 
echo "Setting up Venv"
if [ ! -d "$VENV_PATH" ] 
then
  echo -e "\tCreating Virtual Environment at $VENV_PATH"
  python3 -m venv "$VENV_PATH" 2>&1 |  sed 's/^/\t/g'
else
  echo -e "\tVenv already present at $VENV_PATH"
fi

echo "Activating Venv"
if [ "$(echo $SHELL)" = "/bin/zsh" ] 
then
  source "$VENV_PATH/bin/activate"
  echo "Activated"
else 
  echo -e "\tNo Idea what shell is used, add the correct logic to activate venv here"
fi


echo "Ensuring Ansible is installed"
pip freeze | fgrep 'ansible=' > /dev/null

if [ "$?" = "0" ]
then
  echo -e "\tAnsible is already installed"
else
  pip install ansible 2>&1 |   sed 's/^/\t/g'
fi


