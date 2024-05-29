#!/bin/bash
read -p "Assign a name for this worker:" WORKER
echo "The name assigned to the worker is:" $WORKER

wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.88/lolMiner_v1.88_Lin64.tar.gz && \
tar -xvf lolMiner_v1.88_Lin64.tar.gz && \
cd 1.88 && \
echo '#!/bin/bash

POOL=lolgpu.ton.ninja:9999
WALLET=UQDMNmylhvCpc60Od36V6IZatgdWkL4Bx91-YtYQzGyi5oXR.'$WORKER'

cd "$(dirname "$0")"

./lolMiner -a TON --pool $POOL --user $WALLET --apiport 4444 --ton-mode 6 $@' > minegpu.sh && \
chmod +x minegpu.sh && \
./minegpu.sh