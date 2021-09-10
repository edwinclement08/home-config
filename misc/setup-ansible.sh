which python3 1>/dev/null | sed 's/^/    /g'
if [ $? -ne 0 ] 
then
  echo "Python3 is not installed, halting ansible install"
  exit 13
fi

VENV_PATH="$HOME_CONFIG/venv" 

if [ ! -d "$VENV_PATH" ] 
then
  echo "Creating Virtual Environment at $VENV_PATH"
  python3 -m venv "$VENV_PATH" 2>&1 |  sed 's/^/    /g'
else
  echo "Venv already present at $VENV_PATH"
fi

if [ "$(echo $SHELL)" = "/bin/zsh" ] 
then
  source "$VENV_PATH/bin/activate"
else 
  echo "No Idea what shell is used, add the correct logic to activate venv here"
fi


echo "Installing Ansible"
pip install ansible |   sed 's/^/    /g'


