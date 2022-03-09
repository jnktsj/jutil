#!/bin/bash
# base image: Ubuntu 20.04

sudo apt-get update
sudo apt-get install -y software-properties-common

# enable the CRAN repository and add the CRAN GPG key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository "deb http://cran.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

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


# install python 3.8
sudo apt-get install -y python3 python3-pip python3-dev
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade Pillow
sudo pip3 install pandas numpy scipy matplotlib seaborn
sudo pip3 install virtualenv jupyter ipython


# install R 3.6.3
sudo apt-get install -y r-base r-base-dev r-recommended


# install samtools, bedtools
wget 'https://github.com/samtools/samtools/releases/download/1.14/samtools-1.14.tar.bz2' && \
    tar xf samtools-1.14.tar.bz2 && rm samtools-1.14.tar.bz2 && cd samtools-1.14 && make
sudo make install && make clean && cd ../ && rm -r samtools-1.14
sudo apt-get install -y bedtools


# Set up gcsfuse
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y gcsfuse


# clean VM at the end
sudo apt-get -y clean
sudo apt-get -y autoclean
sudo apt-get -y autoremove

