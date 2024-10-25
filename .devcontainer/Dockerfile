FROM rocker/tidyverse:4.4.1

RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r -n4 \
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

RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
RUN apt-get install --no-install-recommends -y git

RUN apt-get update && apt-get install -y --no-install-recommends gdb 
    
RUN install2.r languageserver

CMD ["bash"]