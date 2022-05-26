#!/bin/bash

xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python3
pip3 install os
pip3 install pandas
pip3 install openpyxl
pip3 install xlsxwriter