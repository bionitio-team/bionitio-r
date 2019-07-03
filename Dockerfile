#FROM r-base:3.6.0
# ubuntu bionic
FROM ubuntu:18.04
WORKDIR /bionitio
COPY . .

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y r-base r-base-dev
RUN Rscript -e "install.packages('optparse', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('seqinr', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('logging', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages('roxygen2', repos='http://cran.rstudio.org')"
RUN Rscript -e "install.packages(c('devtools', 'lintr'), repos='http://cran.rstudio.org')"
RUN R CMD INSTALL bionitio

ENV PATH "/bionitio/:${PATH}"

ENTRYPOINT ["bionitio"]
