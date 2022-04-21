#!/usr/bin/env bash

x=$1

if [[ -e venv/bin/activate ]]; then
  source venv/bin/activate
else
  pip3 install virtualenv
  python3 -m venv venv
  source venv/bin/activate
fi

case $x in
  "build")
    pip install -r ./requirements.txt
  ;;
  "test")
    molecule test
  ;;
esac
