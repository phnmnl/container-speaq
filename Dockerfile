FROM container-registry.phenomenal-h2020.eu/phnmnl/rbase:latest

MAINTAINER PhenoMeNal-H2020 Project (phenomenal-h2020-users@googlegroups.com)

LABEL software=speaq
LABEL software.version=1.2.4
LABEL version=0.1
LABEL Description="speaq: Tools for Nuclear Magnetic Resonance Spectrum Alignment and Quantitative Analysis."

# Install packages for compilation
RUN apt-get -y update && apt-get -y --no-install-recommends install ca-certificates wget zip unzip git libcurl4-gnutls-dev libcairo2-dev libxt-dev libxml2-dev libv8-dev libnlopt-dev libnlopt0 gdebi-core pandoc pandoc-citeproc software-properties-common make gcc gfortran g++ r-recommended r-cran-rcurl r-cran-foreach r-cran-multicore r-cran-base64enc r-cran-qtl r-cran-xml libgsl2 libgsl0-dev gsl-bin libssl-dev && \
 R -e "install.packages(c('Rcpp','rjson', 'V8'), repos='https://mirrors.ebi.ac.uk/CRAN/')" && \
 R -e "install.packages(c('docopt','doParallel', 'ptw', 'signal', 'openxlsx'), repos='https://mirrors.ebi.ac.uk/CRAN/')" && \
 R -e "source('http://bioconductor.org/biocLite.R'); biocLite('MassSpecWavelet'); biocLite('jsonlite'); biocLite('impute');" && \
 R -e "install.packages(c('gsl','RcppGSL','inline'), repos='https://mirrors.ebi.ac.uk/CRAN/')" && \
 R -e "install.packages(c('jsonlite','mime','curl','openssl','R6','httr','rvest'), repos='https://mirrors.ebi.ac.uk/CRAN/')" && \
 R -e "install.packages('speaq', repos='https://mirrors.ebi.ac.uk/CRAN/')"

# De-install not needed packages
apt-get -y --purge --auto-remove remove make gcc gfortran g++ && apt-get -y --purge remove libcurl4-gnutls-dev libcairo2-dev libxt-dev libxml2-dev libv8-dev libnlopt-dev && \
apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /usr/src/rnmr1d /tmp/* /var/tmp/*

# Clean-up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# Add scripts folder to container
#ADD show_chromatogram.r /usr/local/bin/show_chromatogram.r
#RUN chmod +x /usr/local/bin/show_chromatogram.r

# Define Entry point script
#ENTRYPOINT [ "Rscript" ]
#CMD [ "/usr/local/bin/show_chromatogram.r" ]
