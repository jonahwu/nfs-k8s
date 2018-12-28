#FROM 192.168.51.130:5000/ebotubuntu:v0.2
#FROM ubuntu:18.04
FROM jrei/systemd-ubuntu:18.04

# Environment Setting
# working directory
RUN apt-get update
RUN apt-get install nfs-kernel-server -y
COPY exports /etc/exports
COPY nfs-kernel-server /etc/default/nfs-kernel-server
COPY nfs-common /etc/default/nfs-common
COPY modules-load.d-local.conf /etc/modules-load.d/local.conf
RUN mkdir -p /srv/nfs
RUN chmod 777 /srv/nfs
#RUN exportfs -ra //no need to export since it restarted

#EXPOSE 111 111/udp 662 2049 38465-38467
EXPOSE 111 111/udp 662 2049 20048 38465-38467
#ENTRYPOINT ["../entrypoint.sh"]
#ENTRYPOINT ["../run.sh"]
#CMD ["bash","./run.sh"]
#EXPOSE 1337
#CMD ["systemctl", "start", "nfs-ganesha.service"]
#CMD ["sleep", "inf"]
