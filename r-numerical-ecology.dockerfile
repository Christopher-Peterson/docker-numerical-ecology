FROM rocker/geospatial:4.1.1

# Add intel MKL

RUN \
apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends intel-mkl

# Configure MKL 
RUN \
update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so  libblas.so-x86_64-linux-gnu      /usr/lib/x86_64-linux-gnu/libmkl_rt.so 50 && \
update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so.3 libblas.so.3-x86_64-linux-gnu    /usr/lib/x86_64-linux-gnu/libmkl_rt.so 50 && \
update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so  liblapack.so-x86_64-linux-gnu    /usr/lib/x86_64-linux-gnu/libmkl_rt.so 50 && \
update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so.3  liblapack.so.3-x86_64-linux-gnu  /usr/lib/x86_64-linux-gnu/libmkl_rt.so 50

RUN install2.r --error \
  cowplot \
  patchwork \ 
  ggforce \
  vegan
# Forgot to install these ones
RUN install2.r --error \
  ade4 \
  adegraphics \
  adespatial \
  agricolae \
  ape \
  cocorresp \
  dendextend \
  ellipse \
  FactoMineR \
  FD \
  gclus \
  googleVis \
  igraph \
  indicspecies \
  labdsv \
  missMDA \
  picante \
  pvclust \
  rgexf \
  RgoogleMaps \
  rioja \
  rrcov \
  SoDA \
  spdep \
  taxize \
  vegan3d \
  vegclust



# make R able to access libraries
# RUN echo '.libPaths(c("/usr/lib/R/site-library", "/usr/local/lib/R/site-library"))' >> /usr/lib/R/etc/Rprofile.site
