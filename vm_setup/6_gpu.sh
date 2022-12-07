# Dependencies
sudo apt-get install -y build-essential \
    dkms \
    freeglut3 \
    freeglut3-dev \
    libxi-dev \
    libxmu-dev

# Install CUDA
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
sudo apt-get install software-properties-common
sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda

# Add to path
export PATH=$PATH:/usr/local/cuda-11.8/bin
export CUDADIR=/usr/local/cuda-11.8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.8/lib64
