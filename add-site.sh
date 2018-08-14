#!/bin/sh
BASE_DIR=`dirname "$0"`
SITES_DIR=$BASE_DIR/source/_posts

MD5CMD=md5sum
if [ -z `which md5sum` ]; then
	# macOS
	MD5CMD=md5
fi

if [ -z "$1" ]; then
    echo "Usage: $0 url"
    exit 1
fi

echo Site URL: $1

ID=`echo $1@dinosean | $MD5CMD | awk '{print $1}'`
echo Site ID: $ID

echo Generate a site file.
cp $SITES_DIR/.template.md $SITES_DIR/$ID.md
sed "s|{{ title }}|$1|g" $SITES_DIR/.template.md > $SITES_DIR/$ID.md
