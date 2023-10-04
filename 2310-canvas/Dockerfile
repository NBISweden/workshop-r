# DOCKER FILE FOR WORKSHOP-R
# 2023 Roy Francis

FROM rocker/verse:4.2.3
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
  && Rscript -e 'install.packages(c("bookdown","knitr","remotes","fontawesome","formattable","formatR","kableExtra","leaflet","pagedown","lubridate","markdown","rmarkdown","xaringan","yaml"),repos = "https://packagemanager.posit.co/cran/__linux__/jammy/latest");' \
  && mkdir /rmd

RUN Rscript -e 'install.packages(c("tidyverse","nycflights13","vcd","patchwork","vioplot"),repos = "https://packagemanager.posit.co/cran/__linux__/jammy/latest");'
RUN Rscript -e 'remotes::install_github("mkierczak/mkteachr");'
WORKDIR /rmd
CMD Rscript -e "rmarkdown::render_site()"




# build container
# docker build -t ghcr.io/nbisweden/workshop-r:1.0.0 .
# docker tag ghcr.io/nbisweden/workshop-r:1.0.0 ghcr.io/nbisweden/workshop-r:latest

# push to ghcr
# docker login ghcr.io
# docker push ghcr.io/nbisweden/workshop-r:1.0.0
# docker push ghcr.io/nbisweden/workshop-r:latest

# run container
# render all files
# docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v ${PWD}:/rmd ghcr.io/nbisweden/workshop-r:latest
# render one file
# docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v ${PWD}:/rmd ghcr.io/nbisweden/workshop-r:latest Rscript -e 'rmarkdown::render("index.Rmd")'

