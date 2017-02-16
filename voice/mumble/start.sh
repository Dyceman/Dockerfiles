CHK_FILE="/home/container/murmur.x86"
if [ -f $CHK_FILE ]; then
    echo "Murmur executable exists, not downloading. To update, delete murmur.x86."
else
    mkdir -p /home/container/.tmp-build
    cd /home/container/.tmp-build

    curl -sSLO https://github.com/mumble-voip/mumble/releases/download/${MUMBLE_VERSION}/murmur-static_x86-${MUMBLE_VERSION}.tar.bz2

    tar -xjvf murmur-static_x86-${MUMBLE_VERSION}.tar.bz2
    cp -rl murmur-static_x86-${MUMBLE_VERSION}/* /home/container/.

    rm -r /home/container/.tmp-build
    cd /home/container
fi

MODIFIED_STARTUP=`echo ${STARTUP} | perl -pe 's@\{\{(.*?)\}\}@$ENV{$1}@g'`
./murmur.x86 ${MODIFIED_STARTUP}
