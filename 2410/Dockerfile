# DOCKER FILE FOR WORKSHOP-R

FROM ghcr.io/rocker-org/verse:4.4.1
LABEL Description="Docker image for NBIS workshop-r"
LABEL Maintainer="roy.francis@nbis.se"
LABEL org.opencontainers.image.source="https://github.com/NBISweden/workshop-r"

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y \
  libxml2-dev \
  libssl-dev \
  libcurl4-openssl-dev \
  libudunits2-dev \
  libopenblas-base \
  libgdal-dev \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt-get install -y ./google-chrome-stable_current_amd64.deb \
  && rm -rf google-chrome-stable_current_amd64.deb \
  && rm -rf /var/lib/apt/lists/* \
  && Rscript -e 'install.packages(c("formattable","formatR","kableExtra","leaflet","pagedown","markdown"),repos = "https://packagemanager.posit.co/cran/__linux__/jammy/latest");' \
  && mkdir /rmd

# add pkgs needed for labs
RUN Rscript -e 'install.packages(c("nycflights13","vcd","patchwork","vioplot","manipulateWidget"),repos = "https://packagemanager.posit.co/cran/__linux__/jammy/latest");' \
  && Rscript -e 'remotes::install_github("mkierczak/mkteachr");' \
  && Rscript -e 'remotes::install_github("hadley/emo");'
  
WORKDIR /rmd
