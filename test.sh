#!/bin/bash
set -o errexit
set -o pipefail

if [ "$#" -lt "4" ]; then
 echo "Use: $0 dir.teste rpm dir.source.rpm dir.dest"
 exit 1
fi

DIR="$1"
RPM="$2"
SOURCE="$3"
DEST="$4"

DISTS="centos:centos6"
mkdir -p $DIR

cp $SOURCE/$RPM $DIR/

docker run --rm -t -v "$PWD/$DIR:/repo" "$DISTS" bash -c "
set -o errexit
set -o pipefail
set -x

useradd apache
rpm -hiv /repo/$RPM

ls -Rlha /var/www/$DEST/

"
