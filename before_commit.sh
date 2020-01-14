#!/usr/bin/env bash

# Author: Anshuman Dhuliya [AD] (anshumandhuliya@gmail.com)

BKPSYSCONFIG=bkpsysconfigs;

if which $BKPSYSCONFIG; then
  $BKPSYSCONFIG;
else
  echo "ERROR: $BKPSYSCONFIG not in path!!";
  exit 1;
fi

