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
    data.table \
    igraph \
    igraphdata \
    netplot \
    reticulate \
    microbenchmark \
    bench \
    beepr \
    covr \
    R.utils \
    RcppArmadillo \
    ggplot2 \
    dplyr \
    dtplyr \
    maps \
    readr \
    slurmR \
    texreg \
    memisc \
    tm \
    gapminder \
    wordcloud2 \
    rvest


RUN apt-get update && apt-get install -y --no-install-recommends gdb libglpk-dev

CMD ["bash"]
