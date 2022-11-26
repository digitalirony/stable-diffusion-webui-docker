# syntax=docker/dockerfile:1
FROM pytorch/pytorch
WORKDIR /sdui
COPY build_tools/* .
RUN chmod +x ./sd_setup.sh && ./sd_setup.sh
EXPOSE 80
EXPOSE 443
CMD ["/sdui/init.sh"]
