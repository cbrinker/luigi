#!/bin/bash

# An attempte to segreate the bits that are rpm specific away from the general
# setup.py

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

python setup.py bdist_rpm \
  --requires=python-argparse,python-tornado,python-mechanize,python-daemon \
  --post-install="rpm/postinstall.sh"  \
  --pre-uninstall="rpm/preuninstall.sh"  \

cd -
