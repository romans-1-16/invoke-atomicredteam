FROM  mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-Command"]
# -- Install Atomic Red Team from pwsh
RUN IEX (IWR 'https://raw.githubusercontent.com/romans-1-16/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing); \
    Install-AtomicRedTeam -getAtomics

RUN New-Item $PROFILE -Force

COPY ./setup.ps1 .
RUN ./setup.ps1

SHELL ["/bin/bash", "-c"]

COPY ./nginx-install .
RUN ["/bin/bash", "-c", "source ./nginx-install"]
#RUN /bin/bash -c "./install-nginx"

COPY ./default.conf /etc/nginx/conf.d/default.conf

USER root
RUN mkdir -m 755 /root/AtomicRedTeam/ExternalPayloads/
RUN chmod 755 /root/ /root/AtomicRedTeam/ 

#COPY ./nginx-setup .
#RUN ["/bin/bash", "-c", "source ./nginx-setup"]

#CMD ["/usr/sbin/nginx", "-g", "daemon off;"]