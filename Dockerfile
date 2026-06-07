FROM r-base:4.4.2
WORKDIR /bionitio
COPY . .

# apt-get packages below are needed by devtools
RUN apt-get update && apt-get install -y libssl-dev libxml2-dev libcurl4-openssl-dev libgit2-dev libssh2-1-dev libuv1-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev
RUN Rscript -e "install.packages('optparse', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('seqinr', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('logging', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('roxygen2', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('devtools', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('lintr', repos='http://cran.rstudio.org')"
RUN R CMD INSTALL bionitio

ENV PATH "/bionitio/:${PATH}"
