#!/bin/bash
curl -f localhost:9000/health
exit_status=$?
echo before $exit_status
if [ $exit_status -ne 0 ] 
then
  echo fixing return
  exit_status=1
fi
echo after $exit_status
exit $exit_status
