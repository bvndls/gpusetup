#!/bin/bash
echo "Configured Pools:"
echo "1) icemining"
echo "2) ton ninja"
read -p "Select Pool number: " poolnum

case $poolnum in
    1)
        POOL=stratum+tcp://de.gpu.hashrate.to:4002
        WALLET=gpu:UQAt9tz1pgMZaE2SZmpO7xNKh-RbanYPxBqRdM9_xpBSX7IQ
        ;;
    2)
        POOL=lolgpu.ton.ninja:9999
        WALLET=UQAt9tz1pgMZaE2SZmpO7xNKh-RbanYPxBqRdM9_xpBSX7IQ
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

read -p "Assign a name for this worker: " WORKER
echo "The name assigned to the worker is: $WORKER"
tmux rename-window "$WORKER"

REPO="https://github.com/Lolliedieb/lolMiner-releases/releases/latest"
VER=$(curl -sIL "$REPO" | grep -i 'location:' | awk -F"/" '{ printf "%s", $NF }')
URL="https://github.com/Lolliedieb/lolMiner-releases/releases/download/$VER/lolMiner_v${VER}_Lin64.tar.gz"

if [ -d "$VER" ]; then
  echo "Already downloaded. Skipping."
else
  wget "$URL"
  tar -xvf "lolMiner_v${VER}_Lin64.tar.gz"
fi

cd "$VER"
echo '#!/bin/bash
POOL='$POOL'
WALLET='$WALLET'.'$WORKER'
cd "$(dirname "$0")"
./lolMiner -a TON --pool $POOL --user $WALLET --apiport 4444 --ton-mode 6 $@' > minegpu.sh

chmod +x minegpu.sh
./minegpu.sh