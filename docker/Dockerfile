FROM  mcr.microsoft.com/powershell:latest
SHELL ["pwsh", "-Command"]
# -- Install Atomic Red Team from pwsh
RUN IEX (IWR 'https://raw.githubusercontent.com/romans-1-16/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing); \
    Install-AtomicRedTeam -getAtomics

RUN New-Item $PROFILE -Force

COPY ./setup.ps1 .
RUN ./setup.ps1

COPY ./nginx-install .
RUN ["/bin/bash", "-c", "source ./nginx-install"]

#COPY ./default.conf /etc/nginx/conf.d/default.conf

#COPY ./nginx-setup .
#RUN ["/bin/bash", "-c", "source ./nginx-setup"]