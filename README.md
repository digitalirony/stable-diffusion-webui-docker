
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

Please see [Automatic111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui) for more information on how to use this app.

If you want to deploy this project, you don't wan this repo. You want to get the latest image from the registry:

```gcr.io/stablediffusion-369106/sd-webui```


The default login is ```admin:stablediffusion```

If you want to set your own password, you should generate a bcrypt hash of whatever password you want. Then simply pass it as an ENV variable to your docker run:

```WEB_PASS='$2a$12$i4HQ3Um.f0jENfR1rDw2p.fGB8S6huZAQMftn9YuIcFMrk8y671ti' docker run gcr.io/stablediffusion-369106/sd-webui```


Once deployed simply visit ```Http://<your-ip-or-domain>``` (HTTPS/ssl will come later)

At the Interface here you can start and stop the services which consist of:
- caddy  - This is the webserver that sets up the reverse proxy for the rest
- updog ```Http://<your-ip-or-domain>/updog``` - Use this to upload your models for SD
- webui ```Http://<your-ip-or-domain>/webui``` - Once you have uploaded your models start/restart the service and then visit this url to begin using
## Building Your Own
#### REQUIREMENTS:
- [Docker with compose](Https://docker.com)



If you want to modify this build clone this repo:

```git clone git@github.com:digitalirony/stable-diffusion-webui-docker.git```

Then simply use docker compose to build the image:

``` docker compose build```

How to setup and use docker is beyond the scope of this document. See the helpful documents over at [Dockers Website](https://docker.com)

    
