SERVICE=$1
echo "Ensuring $SERVICE is running"

systemctl status $SERVICE 2>&1 > /dev/null 
EXIT_CODE=$?
if [ "$EXIT_CODE" -eq 3 ] 
then
  echo -e "\tStarting Service $SERVICE"
  systemctl enable "$SERVICE" |  sed 's/^/\t/g'
  systemctl start "$SERVICE" |  sed 's/^/\t/g'
elif [ "$EXIT_CODE" -eq 4 ]
then
  echo -e "\t$SERVICE is not installed, quiting"
  exit 15
elif [ "$EXIT_CODE" -eq 0 ]
then
  echo -e "\t$SERVICE is installed and running"
else
  echo -e  "\tStatus is $EXIT_CODE for $SERVICE. exiting"
  exit 16
fi



