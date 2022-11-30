#!/bin/bash
apt-get update 
apt-get -y install git supervisor curl vim libgl1 libglib2.0-0 
mkdir -p /var/log/supervisor
cd /sdui
chmod +x init.sh 
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
mkdir stable-diffusion-webui/repositories
cd stable-diffusion-webui/repositories


git clone -n https://github.com/CompVis/stable-diffusion.git stable-diffusion
cd stable-diffusion
git checkout 69ae4b35e0a0f6ee1af8bb9a5d0016ccb27e36dc 
cd ..


git clone -n https://github.com/CompVis/taming-transformers.git taming-transformers
cd taming-transformers
git checkout 24268930bf1dce879235a7fddd0b2355b84d7ea6
cd ..


git clone -n https://github.com/sczhou/CodeFormer.git CodeFormer
cd CodeFormer
git checkout c5b4593074ba6214284d6acd5f1719b6c5d739af
cd ..

git clone -n https://github.com/crowsonkb/k-diffusion.git k-diffusion
cd k-diffusion
git checkout 60e5042ca0da89c14d1dd59d73883280f8fce991
cd ..

git clone -n https://github.com/salesforce/BLIP.git BLIP
cd BLIP
git checkout 48211a1594f1321b00f14c9f7a5b4813144b2fb9
cd ../..


cp ../requirements_docker.txt .
python -m pip install --upgrade pip wheel
pip install -r requirements_docker.txt --prefer-binary
pip install -r repositories/CodeFormer/requirements.txt --prefer-binary
pip install -r requirements.txt --prefer-binary
pip install -U numpy --prefer-binary
