FROM container-registry.phenomenal-h2020.eu/phnmnl/rbase:latest

MAINTAINER PhenoMeNal-H2020 Project (phenomenal-h2020-users@googlegroups.com)

LABEL software=speaq
LABEL software.version=1.2.2
LABEL version=0.1
LABEL Description="speaq: Tools for Nuclear Magnetic Resonance Spectrum Alignment and Quantitative Analysis."

# Install packages for compilation
RUN apt-get -y update
RUN apt-get -y --no-install-recommends install make gcc gfortran g++

# Install dependencies
RUN R -e 'source("https://bioconductor.org/biocLite.R"); biocLite("MassSpecWavelet")'
 
# Install speaq
RUN R -e 'install.packages("speaq", repo="https://mirrors.ebi.ac.uk/CRAN/")'

# De-install not needed packages
RUN apt-get -y --purge --auto-remove remove make gcc gfortran g++

# Clean-up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# Add scripts folder to container
#ADD show_chromatogram.r /usr/local/bin/show_chromatogram.r
#RUN chmod +x /usr/local/bin/show_chromatogram.r

# Define Entry point script
#ENTRYPOINT [ "Rscript" ]
#CMD [ "/usr/local/bin/show_chromatogram.r" ]
