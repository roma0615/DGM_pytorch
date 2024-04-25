#!/bin/bash
set -e

eval "$(conda shell.bash hook)"
MINIFORGE_DIR=${CONDA_EXE%/*/*}
source "$MINIFORGE_DIR/etc/profile.d/mamba.sh"

mamba create -n DGMenv python=3.8 -y
mamba activate DGMenv

mamba install -c anaconda cmake=3.19 -y # this is causing all my problems. try at end??
mamba install pytorch=2.2.0 torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia -y
mamba install pyg=2.5.2 -c pyg -y
# mamba install cudatoolkit=12.1 -c pytorch
mamba install pytorch-scatter=2.1.2 pytorch-sparse=0.6.18 -c pyg -y

mamba install -c "nvidia/label/cuda-12.1.0" cuda-toolkit -y
mamba install torchmetrics=0.6.0 -y

pip install cython
pip install pytorch_lightning==1.4.0rc0

# todoo check which versin of pytorch got installed
# pytorch 2.1.0
# pip install torch-scatter==2.1.2 -f https://data.pyg.org/whl/torch-2.1.0+cu121.html
# pip install torch-sparse==0.6.18 -f https://data.pyg.org/whl/torch-2.1.0+cu121.html
# pip install torch-geometric
