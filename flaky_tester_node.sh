# params 1) module name of node IT
function flaky_node_tester {
  LINE='=============================================================================\n'
  COUNTER=1.0
  MAX_RUN_LIMIT=200
  MODULE_NAME=$1

  # COLORS
  GREEN="\033[0;32m"
  RED='\033[0;31m'
  NC='\033[0m'

  echo "Started testing flakiness of the following test:"
  echo $MODULE_NAME
  echo $LINE
  while [[ $COUNTER -lt $MAX_RUN_LIMIT ]]
  do
    OUTPUT=$(npm test -- -f "$MODULE_NAME")
    echo $LINE
    echo $OUTPUT
    echo $LINE
    ANY_FAILURE='failing'
    if [[ "$OUTPUT" == *"$ANY_FAILURE"* ]]; then
      echo "Failed at ==> $COUNTER"
      echo $OUTPUT
      
      FAILURE_REGEX="FAILED"
      FAILURE_MESSAGE=$(echo $OUTPUT | grep -o "$FAILURE_REGEX.*")
      break
    else
      echo " ✓ passed on $COUNTER (th) run"
    fi
     echo " $COUNTER running"
     COUNTER=$[$COUNTER + 1]

  done
  echo "Report result"
  printf $LINE

  echo "It $COUNTER time(s) took to fail" 
  echo "${RED} Failure message: $FAILURE_MESSAGE ${NC}"
  SUCCESS_RATE="$((($COUNTER/($COUNTER + 1)*100)))"
  echo "${GREEN}SUCCESS RATE: $SUCCESS_RATE % ${NC}" 
}