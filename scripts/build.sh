#!/bin/sh

ROOT_PWD=$(dirname $(dirname "$0"))

cd "$ROOT_PWD"

if [ -d patches ] ; then
	for patch in patches/* ; do
		git apply "$patch" || exit 1
	done
fi

cp -f cfg/config.h config.h 2>/dev/null

sudo make clean install

make clean
rm config.h
