### gpusetup

A small script to speed up lolminer setup.
Configured pools: icemining, ton ninja

### script flow
1. select the number of the pool
2. assign a name to your worker (will be used as tmux session name and in lolminer)
3. the script will download the latest lolminer, extract it and create a `minegpu.sh` file filled with the selected pool, the default wallet address, worker name and the lolminer settings required to start mining.

### to-do
1. add default wallet override
2. integrate with ntfy.sh
3. add various status notifications (low hashrate, mining start/stop, config summary)