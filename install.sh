#!/bin/bash

#Setup paths
INSTALL_BASE=${INSTALL_BASE:-"$HOME/bin"}
BIN_PATH=${BIN_PATH:-"${INSTALL_BASE}"}

#String quoting helper
function quoteReplacement() {
  echo "$1" | sed -e 's/\//\\\//g'
}

function installPrimaryBinary() {
  F_BIN_PATH=$(quoteReplacement "$LIB_BIN_PATH")
  cat "bin/$1" | \
	  sed -e "s/!F_BIN_PATH!/$F_BIN_PATH/g" \
	  > "$BIN_PATH/$1"
  chmod +x "$BIN_PATH/$1"
}

#Install primary binaries
if [ ! -d "$BIN_PATH" ]; then
	mkdir -p "$BIN_PATH";
fi
for FILE in `ls bin`
do
	installPrimaryBinary "$FILE"
done

#Install python scripts
cd python
if [ "--user" = "$1" ]; then
  python3 setup.py install --user
else
  python3 setup.py install
fi
rm -r ./build
