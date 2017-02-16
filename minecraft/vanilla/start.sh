#!/bin/ash
LATEST_VERSION=`curl -s https://s3.amazonaws.com/Minecraft.Download/versions/versions.json | grep -o "[[:digit:]]\.[0-9]*\.[0-9]" | head -n 1`

if [ -z "$VANILLA_VERSION" ] || [ "$VANILLA_VERSION" == "latest" ]; then
  DL_VERSION=$LATEST_VERSION
else
  DL_VERSION=$VANILLA_VERSION
fi

if [ -z "$SERVER_JARFILE" ]; then
    SERVER_JARFILE="server.jar"
fi

CHK_FILE="/home/container/${SERVER_JARFILE}"

if [ -f $CHK_FILE ]; then
   echo "A ${SERVER_JARFILE} file already exists in this location, not downloading a new one."
else
   echo "$ curl -sS https://s3.amazonaws.com/Minecraft.Download/versions/${DL_VERSION}/minecraft_server.${DL_VERSION}.jar -o ${SERVER_JARFILE}"
   curl -sS https://s3.amazonaws.com/Minecraft.Download/versions/${DL_VERSION}/minecraft_server.${DL_VERSION}.jar -o ${SERVER_JARFILE}
fi

cd /home/container

if [ -z "$STARTUP"  ]; then
    # Output java version to console for debugging purposes if needed.
    java -version

    echo "$ java -jar server.jar"

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
