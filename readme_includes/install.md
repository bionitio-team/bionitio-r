### Installing R

Download R from [CRAN](https://www.r-project.org/) and follow the instructions
there to install it.

bionitio.R was tested on R version 3.2.

### Installing dependencies

Bionitio requires the optparse, seqinr, and logging packages which can be installed by:

```bash
Rscript -e "install.packages(c('optparse', 'seqinr', 'logging'), repos='http://cran.rstudio.org')"
```

### Installing the bionitio package

To install the bionitio package:

```bash
R CMD INSTALL bionitio
```

