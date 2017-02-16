#!/bin/ash
FFNHAGWTGV=$(curl -sl http://files.minecraftforge.net/maven/net/minecraftforge/forge/ | grep -A1 Latest | grep  -o -e '[1]\.[0-9][0-9] - [0-9][0-9]\.[0-9][0-9]\.[0-9]\.[0-9][0-9][0-9][0-9]')
LATEST_VERSION=$(echo $FFNHAGWTGV | sed 's/ //g')

if [ -z "$FORGE_VERSION" ] || [ "$FORGE_VERSION" == "latest" ]; then
    DL_VERSION=$LATEST_VERSION
else
    DL_VERSION=$FORGE_VERSION
fi

if [ -z "$SERVER_JARFILE" ]; then
    SERVER_JARFILE="forge.jar"
fi

CHK_FILE="/home/container/${SERVER_JARFILE}"

if [ -f $CHK_FILE ]; then
    echo "A ${SERVER_JARFILE} file already exists in this location, not downloading a new one."
else
    if [ -f forge-installer.jar ]; then
      echo "found installer jar"
      java -jar forge-installer.jar --installServer
      rm forge-installer.jar
      mv forge-*universal.jar $SERVER_JARFILE
    else
        echo "$ curl -sS http://files.minecraftforge.net/maven/net/minecraftforge/forge/${DL_VERSION}/forge-${DL_VERSION}-installer.jar -o forge-installer.jar"
        curl -sS http://files.minecraftforge.net/maven/net/minecraftforge/forge/${DL_VERSION}/forge-${DL_VERSION}-installer.jar -o forge-installer.jar
        java -jar forge-installer.jar --installServer
        rm forge-installer.jar
        mv forge-*universal.jar $SERVER_JARFILE
    fi
fi

if [ -z "$STARTUP"  ]; then
    # Output java version to console for debugging purposes if needed.
    java -version

    echo "$ java -jar $SERVER_JARFILE.jar"

    # Run the server.
    java -jar ${SERVER_JARFILE}
else
    # Output java version to console for debugging purposes if needed.
    java -version

    # Pass in environment variables.
    MODIFIED_STARTUP=`echo ${STARTUP} | perl -pe 's@\{\{(.*?)\}\}@$ENV{$1}@g'`
    echo "$ java ${MODIFIED_STARTUP}"

    # Run the server.
    java ${MODIFIED_STARTUP}
fi
