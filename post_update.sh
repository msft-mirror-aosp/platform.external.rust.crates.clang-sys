#!/bin/bash

# $1 Path to the new version.
# $2 Path to the old version.

set -x
set -e

# Change src/link.rs to include files from ../out/
SRCFILE=src/link.rs
OLDSTR='include!(concat!(env!("OUT_DIR"), "/common.rs"));'
NEWSTR='include!("../out/common.rs");'
sed -i -e "s:$OLDSTR:$NEWSTR:" $SRCFILE
# Make sure that sed replaced $OLDSTR with $NEWSTR
grep "$NEWSTR" $SRCFILE > /dev/null

OLDSTR='include!(concat!(env!("OUT_DIR"), "/dynamic.rs"));'
NEWSTR='include!("../out/dynamic.rs");'
sed -i -e "s:$OLDSTR:$NEWSTR:" $SRCFILE
# Make sure that sed replaced $OLDSTR with $NEWSTR
grep "$NEWSTR" $SRCFILE > /dev/null
