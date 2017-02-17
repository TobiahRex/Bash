#!/bin/bash
isExistingApp = `pgrep httpd`
if [[ -n $isExistingApp ]]; then
  service httpd stop
fi
