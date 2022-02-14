#!/bin/bash

for i in {30..50}

 do 

  aws elasticbeanstalk delete-application-version --application-name "LemonSquad Production" --version-label "lemonsquad-release-$i"

done
