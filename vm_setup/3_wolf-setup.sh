# Create mount point
sudo mkdir /mnt/nfs && chmod 777 /mnt/mfs

# Install required packages for wolF
sudo apt-get install -y nfs-common docker.io nfs-kernel-server
sudo pip3 install docker-compose google-crc32c
sudo pip3 install prefect==0.14.16

# Change docker permission to run it without sudo
sudo groupadd docker; sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# Download Getz lab tools
cd ~/ && mkdir src && cd src
gsutil cp gs://getzlab-secrets/github-service-account/github ~/.ssh/getzlab && chmod 400 ~/.ssh/getzlab
GIT_SSH_COMMAND='ssh -i ~/.ssh/getzlab -o IdentitiesOnly=yes' git clone git@github.com:getzlab/canine.git
cd canine && sudo pip3 install . && cd ../
GIT_SSH_COMMAND='ssh -i ~/.ssh/getzlab -o IdentitiesOnly=yes' git clone git@github.com:getzlab/wolF.git
cd wolF && sudo pip3 install . && cd ../
GIT_SSH_COMMAND='ssh -i ~/.ssh/getzlab -o IdentitiesOnly=yes' git clone git@github.com:getzlab/slurm_gcp_docker.git
cd slurm_gcp_docker

# Run this manually
#  1. Add new nodes (e.g. n1-highmem-16 , etc) to 'nodetypes.json' in './conf'
#     Machine types can be found in: https://cloud.google.com/compute/docs/general-purpose-machines
#  2. Edit 'nodetypes.json' file
#      - 'number' = how many machines to spin up as components of a slurm cluster
#      - 'realmemory' = GB x 1024 - (memory for OS)
#  2. Move the json file to slurm_gcp_docker/src
#  3. Add a "COPY nodetypes.json /usr/local/share/slurm_gcp_docker/conf/nodetypes.json" line to Dockerfile
#  4. Run gcloud auth login --update-adc
#  5. Run ./setup.sh
#
#  <command>
#  cd slurm_gcp_docker/src/ && ./setup.sh && ./install_service.py
#  sudo systemctl start prefectserver
#  sudo systemctl enable prefectserver
