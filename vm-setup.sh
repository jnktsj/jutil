#!/bin/bash
# base image: Ubuntu 18.04

sudo apt-get update
sudo apt-get install -y software-properties-common

# enable the CRAN repository and add the CRAN GPG key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository "deb http://cran.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran35/"

# install basic/essential dev packages
sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y \
  git \
  less \
  wget \
  curl \
  unzip \
  emacs \
  openjdk-8-jdk \
  libboost-all-dev \
  zlib1g-dev \
  libssl-dev \
  libncurses-dev \
  liblzma-dev \
  libbz2-dev \
  lbzip2 \
  libcurl4-openssl-dev


# install python 3.6.9
sudo apt-get install -y python3 python3-pip python3-dev
pip3 install --upgrade pip
pip3 install --upgrade Pillow
pip3 install pandas numpy scipy matplotlib
pip3 install virtualenv jupyter


# instal R 3.6.3
sudo apt-get install -y r-base r-base-dev r-recommended


# set up github
git config --global user.name "Junko Tsuji"
git config --global user.email $(whoami)@broadinstitute.org
git config --global core.editor emacs
# after generating the key, add the public key to github account:
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
ssh-keygen -t rsa -b 4096 -C $(whoami)@broadinstitute.org
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa


# clean VM at the end
sudo apt-get -y clean
sudo apt-get -y autoclean
sudo apt-get -y autoremove

