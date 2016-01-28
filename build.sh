#!/bin/bash
set -o errexit
set -o pipefail

if [ "$#" -lt "3" ]; then
 echo "Use: $0 Spec.file dir.package targz.file arch"
 exit 1
fi

SPEC="$1"
PACKAGE="$2"
TARGZ="$3"
ARCH="$4"


if [ -n $ARCH ];
then
  if grep -q Arch $SPEC 
    then
      ARCH=`grep Arch $SPEC |awk '{print $2}'`
      echo "defined $ARCH"
  else
    ARCH="x86_64"
    echo "defined $ARCH"
  fi
fi

#REQUIRES=`grep -m 1 requires $SPEC |awk '{ print substr($0, index($0,$3)) }'`

DISTS="centos:centos6"
mkdir -p $PACKAGE

cp $SPEC $TARGZ $PACKAGE/

docker run --rm -t -v "$PWD/$PACKAGE:/repo" "$DISTS" bash -c "
set -o errexit
set -o pipefail
set -x

# Yum
yum --nogpgcheck -y upgrade
yum --nogpgcheck -y install rpm-build createrepo tar

# Prepare build dir
cd /tmp
mkdir rpmbuild
cd rpmbuild
mkdir BUILD RPMS SOURCES SPECS SRPMS
cd SPECS
mv -v /repo/$SPEC .
chown root.root $SPEC
mv -v /repo/* ../SOURCES/
chown root.root ../SOURCES/*

# Build
cd /tmp/rpmbuild/SPECS

rpmbuild -ba $SPEC --define '%_topdir /tmp/rpmbuild'

cp ../RPMS/$ARCH/* /repo/
cp ../SRPMS/* /repo/
"
