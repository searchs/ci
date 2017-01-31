# New Jenkins Job
www.ohpriceweb.trunk-build-scalatest-testandlearn-stubbed-desktop.ui

perforce.exp-tools.net:1994

Projejct to Watch:
www.expweb.trunk-stubbed-deploy

# Bash Runner:
#!/bin/bash

echo "Running as: `whoami`"

export LANG=en_US.UTF-8

ulimit -u 4096

export BUILD_BRANCHTYPE=trunk
export BUILD_VERSION=trunk
export P4_PATH=//www/expweb/trunk


pushd trunk

# clean up files that are archived but not automatically removed before each build
[ -f logs/events.log ] && echo "Cleaning up log file logs/events.log" && rm -f logs/events.log
[ -f logs/ohprice-base.log ] && echo "Cleaning up log file logs/ohprice-base.log" && rm -f logs/ohprice-base.log

#gradlew
CMD="./gradlew clean checkout.ui:scalatestAcceptance -Denvironment=JENKINS_STUBBED -Dbrowser=chrome -Dwebdriver.chrome.driver=.\ui\test\cucumber\core\ext\chromedrv\win\2.24\chromedriver.exe -Dtags=TestAndLearn --stacktrace"
echo "Running [$cmd]"
$cmd
grc=$?
if [ $grc -ne 0 ]
then
  popd
  echo "Gradle Return Code was [$grc]"
  exit 1
else
  echo "Gradle Return Code was [$grc]"
  popd
  exit 0
fi

# HTML Archive: trunk/checkout.ui/build/reports/acceptanceTest


