#!/usr/bin/env bash
set -e

DOMAIN=repozitorij.uni-lj.si

if [ ! -z "$1" ] ; then DOMAIN=$1; fi

psql -P footer=off -t -A -F"," -U postgres u3_dev \
  -c "SELECT './data/files/' || files[1] FROM sources s WHERE
    s.domain = '$DOMAIN' AND
    (s.files IS NOT NULL AND array_length(s.files,1) >= 1)"