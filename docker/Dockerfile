FROM  mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-Command"]
# -- Install Atomic Red Team from pwsh
#RUN IEX (IWR 'https://raw.githubusercontent.com/romans-1-16/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing); \
#    Install-AtomicRedTeam -getAtomics

COPY ./install-atomicredteam.ps1 .
COPY ./install-atomicsfolder.ps1 .

RUN IEX (Get-Content -Raw ./install-atomicredteam.ps1); Install-AtomicRedTeam -getAtomics

RUN New-Item $PROFILE -Force

COPY ./setup.ps1 .
RUN ./setup.ps1

SHELL ["/bin/bash", "-c"]

COPY ./nginx-install .
RUN chmod +x /nginx-install
RUN ["/bin/bash", "-c", "source ./nginx-install"]
#RUN /bin/bash -c "./install-nginx"

COPY ./default.conf /etc/nginx/conf.d/default.conf

USER root
RUN mkdir -m 755 /root/AtomicRedTeam/ExternalPayloads/; chmod 755 /root/ /root/AtomicRedTeam/

#CMD ["nginx", "-g", "daemon off;"]

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash"]