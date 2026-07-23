FROM ghcr.io/rocker-org/devcontainer/r-ver:4.5

# Architecture-specific variable (built in Docker BuildKit)
ARG TARGETARCH

# Install quarto-cli and the orange-book extension
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.35/quarto-1.9.35-linux-${TARGETARCH}.deb && \
    dpkg -i quarto-1.9.35-linux-${TARGETARCH}.deb && \
    rm quarto-1.9.35-linux-${TARGETARCH}.deb

RUN install2.r -n4 --error \
    renv \
    pander \
    igraph \
    igraphdata \
    netplot \
    reticulate \
    microbenchmark \
    bench \
    R.utils \
    maps
    
RUN \
Rscript --vanilla -e 'reticulate::install_python()' && \
Rscript --vanilla -e 'reticulate::virtualenv_create("r-reticulate")' && \
Rscript --vanilla -e 'reticulate::py_install("datatable")'

RUN \
Rscript --vanilla -e 'reticulate::py_install("pandas")'

RUN apt-get update && apt-get install -y --no-install-recommends gdb 
    

CMD ["bash"]