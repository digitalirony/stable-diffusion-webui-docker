# syntax=docker/dockerfile:1
FROM pytorch/pytorch
WORKDIR /sdui
RUN apt-get update &&\
apt-get -y install git supervisor curl &&\
curl -sS https://webi.sh/caddy | sh
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf .
COPY Caddyfile .
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui &&\
mkdir stable-diffusion-webui/repositories &&\
git clone https://github.com/CompVis/stable-diffusion.git stable-diffusion-webui/repositories/stable-diffusion &&\
git clone https://github.com/CompVis/taming-transformers.git stable-diffusion-webui/repositories/taming-transformers &&\
git clone https://github.com/sczhou/CodeFormer.git stable-diffusion-webui/repositories/CodeFormer &&\
git clone https://github.com/salesforce/BLIP.git stable-diffusion-webui/repositories/BLIP
WORKDIR stable-diffusion-webui
COPY requirements_docker.txt .
RUN python -m pip install --upgrade pip wheel &&\
pip install -r requirements_docker.txt --prefer-binary &&\
pip install -r repositories/CodeFormer/requirements.txt --prefer-binary &&\
pip install -r requirements.txt --prefer-binary &&\
pip install -U numpy --prefer-binary
EXPOSE 80
CMD ["/usr/bin/supervisord", "-n", "-c", "/sdui/supervisord.conf"]
