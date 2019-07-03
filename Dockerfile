FROM r-base:3.6.0
WORKDIR /bionitio
COPY . .

Run Rscript -e "install.packages('optparse', repos='http://cran.rstudio.org')"
Run Rscript -e "install.packages('seqinr', repos='http://cran.rstudio.org')"
Run Rscript -e "install.packages('logging', repos='http://cran.rstudio.org')"
Run Rscript -e "install.packages('roxygen2', repos='http://cran.rstudio.org')"
Run Rscript -e "install.packages(c('devtools', 'lintr'), repos='http://cran.rstudio.org')"
Run R CMD INSTALL bionitio

ENV PATH "/bionitio/:${PATH}"

ENTRYPOINT ["bionitio"]
