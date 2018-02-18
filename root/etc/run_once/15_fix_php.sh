#!/bin/sh

# make link /usr/bin/php ->  /usr/bin/php7 if missing
if [ ! -f /usr/bin/php ]; then
  ln -s /usr/bin/php7 /usr/bin/php
fi

