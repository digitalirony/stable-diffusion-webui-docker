
# Stable Diffusion Webui Docker
This builds Automatic1111 stable-diffusion-webui into an easy to use docker image based on pytorch/pytorch. This is for use with NVIDIA hardware only!!!

 This can then be deployed on services such as Vast.ai



## Acknowledgements
 
 - [Stable Diffusion](https://github.com/CompVis/stable-diffusion)
 - [Automatic1111 Stabile Diffusion Webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
 - [Updog](https://github.com/sc0tfree/updog)
 - [supervisor](https://github.com/Supervisor/supervisor)
 - [Caddy](https://github.com/caddyserver/caddy)
 - [pytorch](https://github.com/pytorch/pytorch)

## Deployment

You need to go to duckdns.org and sign up for a new FREE account. Create a subdomain. Get your API token and save both where you will find them later.

Please see [Automatic111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui) for more information on how to use this app.

If you want to deploy this project, you don't wan this repo. You want to get the latest image from the registry:

```gcr.io/stablediffusion-369106/sd-webui```


Set the ADMIN_PASS, DUCK_DOMAIN and DUCK_TOKEN . If your domain is myAwesomedomain.duckdns.org, only supply 'myAwesomedomain' I already know about the duckdns.org part.  Also open port 80 and 443 as you see here:

```ADMIN_PASS='myBrandSpankinNewPassW0rd' DUCK_DOMAIN="myAwesemedomain" DUCK_TOKEN="abc123aaabbbccc111222333" docker run -p 80:80 -p 443:443 gcr.io/stablediffusion-369106/sd-webui```


Once deployed simply visit ```Https://<your-ip-or-domain>```

Before you can go any further make sure you go to updog(see below), and upload your models. SD/webui will NOT start until you have provided models. If you install any plugins use the dashboard to restart the webui to finish installing them. 

At the Interface here you can start and stop the services which consist of:
- caddy  - This is the webserver that sets up the reverse proxy for the rest if you stop this, you will wish you hadn't
- updog ```Https://updog.yourdomain.duckdns.org``` - Use this to upload your models for SD
- webui ```Https://webui.yourdomain.duckdns.org``` - Once you have uploaded your models start/restart the service and then visit this url to begin using


## Building Your Own
#### REQUIREMENTS:
- [Docker with compose](Https://docker.com)
- Golang


If you want to modify this build clone this repo:

```git clone git@github.com:digitalirony/stable-diffusion-webui-docker.git```

Then simply use my shitty shell script:

``` ./build.sh```

How to setup and use docker is beyond the scope of this document. See the helpful documents over at [Dockers Website](https://docker.com)
