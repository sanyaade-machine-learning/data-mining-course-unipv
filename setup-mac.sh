#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  && 
brew tap homebrew/science &&
brew install makedepend git python3 gcc suite-sparse swig &&

pip3 install virtualenv &&
virtualenv -p python3 orange3env &&
source orange3env/bin/activate &&

git clone https://github.com/biolab/orange3 &&
cd orange3 &&
pip install numpy &&
pip install -r requirements.txt &&
python setup.py develop &&
pip install ipython[all] Orange-Bioinformatics networkx python-igraph

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ipython notebook
