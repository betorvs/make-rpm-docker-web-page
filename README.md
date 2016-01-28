# Make a RPM from tar.gz for simple websties

## First, make a clone from this repository.

## Inside your directory, you see this:

build.sh test.sh website.spec website-1.0.0.0.tar.gz

## Remember, you need change this settings inside website.spec if you need to change the version and source.

```
Version:	1.0.0
Release:	0%{?dist}
...
Source0:	website-1.0.0.0.tar.gz
```

## For a build, use this command.

```
./build.sh website.spec website website-1.0.0.0.tar.gz
```

## This command above make the RPM for you.

## Test this RPM with this simple script test.sh:

```
./test.sh test website-1.0.0-0.noarch.rpm website
```

## How to adapt for my website with more archives:

Adjust the section %files inside website.spec with all new directories and files.

## How to contribute

Make a fork and have fun!

## Release
First version Roberto Scudeller - beto.rvs (at) gmail.com
