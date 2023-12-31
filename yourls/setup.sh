echo YOURLS setup : starting

docker network inspect yourls >/dev/null 2>&1 || docker network create yourls

echo YOURLS setup : done
echo YOURLS require a manual installation, go to /admin proceed