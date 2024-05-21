#!/bin/bash

apt install nano -y && \
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.88/lolMiner_v1.88_Lin64.tar.gz && \
tar -xvf lolMiner_v1.88_Lin64.tar.gz && \
cd 1.88 && \
echo '#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=lolgpu.ton.ninja:9999
WALLET=UQAt9tz1pgMZaE2SZmpO7xNKh-RbanYPxBqRdM9_xpBSX7IQ
PASS=6ynC9JvSL_.egV

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner -a TON --pool $POOL --user $WALLET --pass --apiport 4444 --ton-mode 6 $@' > minegpu.sh && \
chmod +x minegpu.sh && \
./minegpu.sh