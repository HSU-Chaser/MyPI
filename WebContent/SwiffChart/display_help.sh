#!/bin/sh

# Displaying Swiff Chart Generator 3 Help requires Mozilla 1.0
dn=`dirname $0`
dir=`cd $dn ; pwd`
mozilla file://$dir/help/index.html
