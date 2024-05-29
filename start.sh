#!/bin/bash

echo "Configured Pools:"
echo "1) icemining"
echo "2) ton ninja"
read -p "Select Pool number: " pool

case $pool in
    1)
        chmod +x icemining_gpu.sh && ./icemining_gpu.sh
        ;;
    2)
        chmod +x ton_ninja_gpu.sh && ./ton_ninja_gpu.sh
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac