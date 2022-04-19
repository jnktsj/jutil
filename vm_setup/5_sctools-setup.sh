# install python 3.8
sudo apt-get install -y python3 python3-pip python3-dev
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade Pillow
sudo pip3 install \
    natsort==8.1.0 \
    tables==3.7.0 \
    numexpr==2.8.1 \
    numba==0.55.1 \
    numpy==1.21.5

sudo pip3 install \
    pandas==1.4.1 \
    scipy==1.8.0 \
    h5py==3.6.0 \
    anndata==0.7.8

sudo pip3 install \
    pynndescent \
    umap-learn \
    leidenalg \
    harmonypy \
    rpy2==3.4.2 \
    anndata2ri==1.0.6

sudo pip3 install scanpy==1.8.2 scrublet==0.2.3

sudo pip3 install matplotlib==3.5.1 seaborn==0.11.2
sudo pip3 install virtualenv jupyter ipython rmate

