# Install single-cell related tools after creating VM

# CellRanger v6.0.2
wget -O cellranger-6.0.2.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-6.0.2.tar.gz?Expires=1645029072&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci02LjAuMi50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2NDUwMjkwNzJ9fX1dfQ__&Signature=E7ZvLQ4SKtkNbV0rShlNgRo73M0PZBl5Qr-WMOUkUH-5Z-uAVDNddj6YJpTCNyHF5oOp~M156-Jb2ACUsS45ZV~~d13GCU3lDhgCRkCyeG9f4fPK6QXeZURj~pbqxXzbdvHHDbzLfB~EZkkGGR9Jz6j2JI8bXA78b9PtBHzSNzf4~LZQGkrpBgad1k9-PmnECxa7hgK6dotC8Vy6merTgUNriGSWQVAYSz2eA7JTcdB69nyWchQFgM7nfO6CZsVt4kviNgJM-ZYgn-QNiEtPB0W8P0-T480qi2r5FdJ2mPSjhsc0Amv11wNW0P8msXeDLChDzbXsfIZN4KJERAZCFA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
sudo mv ~/cellranger-6.0.2.tar.gz /opt && cd /opt
sudo tar xvzf cellranger-6.0.2.tar.gz && sudo rm cellranger-6.0.2.tar.gz
export PATH=/opt/cellranger-6.0.2:$PATH

# GEX reference
wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz

# python packages for single cell analysis
pip3 install scanpy scrublet anndata

# wolf related set up
pip3 install canine
