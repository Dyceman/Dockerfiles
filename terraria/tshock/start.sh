sleep 3

CHK_FILE="/home/container/TerrariaServer.exe"
if [ -f $CHK_FILE ]; then
    echo "Terraria Server file exists. To reinstall delete TerrariaServer.exe"
else
    mkdir -p /home/container/.tmp-build
    cd /home/container/.tmp-build

    echo "> curl -sSLO https://github.com/NyxStudios/TShock/releases/download/v${T_VERSION}/tshock_${T_VERSION}.zip"
    curl -sSLO https://github.com/NyxStudios/TShock/releases/download/v${T_VERSION}/tshock_${T_VERSION}.zip

    unzip -o tshock_${T_VERSION}.zip -d /home/container
    rm -rf /home/container/.tmp-build
    cd /home/container
fi

MODIFIED_STARTUP=`echo ${STARTUP} | perl -pe 's@\{\{(.*?)\}\}@$ENV{$1}@g'`
mono TerrariaServer.exe ${MODIFIED_STARTUP}
