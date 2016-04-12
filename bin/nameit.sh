curl 'http://localhost:8002/os/hostname?name=es-master-1' -s -X POST -o /dev/null
curl 'http://localhost:8003/os/hostname?name=es-master-2' -s -X POST -o /dev/null
curl 'http://localhost:8004/os/hostname?name=es-master-3' -s -X POST -o /dev/null



echo '127.0.0.1 localhost osv.local'
curl 'http://localhost:8002/network/ifconfig/eth1' -s | jq '.config.addr' | xargs echo -n
echo '  es-master-1'
curl 'http://localhost:8003/network/ifconfig/eth1' -s | jq '.config.addr' | xargs echo -n
echo '  es-master-2'
curl 'http://localhost:8004/network/ifconfig/eth1' -s | jq '.config.addr' | xargs echo -n
echo '  es-master-3'
