#!/bin/ash
LATEST_VERSION=($curl -sl http://www.sa-mp.com/download.php | awk '/Linux Server/{i++}i==2' | sed -n 's/.*href="\([^"]*\).*/\1/p')
