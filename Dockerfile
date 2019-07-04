FROM r-base:3.6.0
WORKDIR /bionitio
COPY . .

# apt-get packages below are needed by devtools
RUN apt-get update && apt-get install -y libssl-dev libxml2-dev libcurl4-openssl-dev libgit2-dev libssh2-1-dev
RUN Rscript -e "install.packages('optparse', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('seqinr', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('logging', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('roxygen2', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('devtools', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('lintr', repos='http://cran.rstudio.org')"
RUN R CMD INSTALL bionitio

ENV PATH "/bionitio/:${PATH}"

ENTRYPOINT ["bionitio.R"]
