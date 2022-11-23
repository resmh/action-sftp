#!/bin/bash
set -e

INPUT_HOST=${INPUT_HOST:-''}
INPUT_USER=${INPUT_USER:-''}
INPUT_PASSWORD=${INPUT_PASSWORD:-''}

INPUT_SOURCE=${INPUT_SOURCE:-''}
INPUT_TARGET=${INPUT_TARGET:-''}

echo "Installing prerequisites..."
sudo apt-get install -y sshpass
echo "Prerequisites met."

echo "Preparing upload..."
echo "" > ./sftp.tmp
for sourcefile in $INPUT_SOURCE; do
	echo "put $sourcefile" >> ./sftp.tmp
done
echo "Upload prepared."

echo "Uploading..."
sshpass -p "$INPUT_PASSWORD" sftp -o "StrictHostKeyChecking=no" "${INPUT_USER}@${INPUT_HOST}:${INPUT_TARGET}" < ./sftp.tmp
echo "Upload completed."

echo "Cleaning up..."
rm sftp.tmp
echo "Cleanup done."

echo "Successfully uploaded files."
exit 0


