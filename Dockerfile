FROM rocker/rstudio


ARG linux_user_pwd

RUN echo "rstudio:${linux_user_pwd}" | chpasswd

RUN apt update && apt install -y man-db && yes | unminimize && rm -rf /var/lib/apt/lists/*


RUN Rscript -e "install.packages('tinytex')"
RUN Rscript -e "tinytex::install_tinytex()"

RUN Rscript --no-restore --no-save -e "install.packages(c(\"tidyverse\", \"MatchIt\", \
    \"rmarkdown\", \"knitr\", \"naniar\", \"pacman\", \"ggplot2\", \"dplyr\", \"ggpubr\", \
    \"cobalt\", \"gridExtra\", \"geepack\", \"broom\", \"bcaboot\", \"magrittr\", \
    \"FDRestimation\", \"tidyr\", \"quickmatch\", \"gt\", \"png\", \"reticulate\"))"

RUN apt update && apt install -y python3 python3-pip
#RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install dask[dataframe] pandas


RUN echo "library(reticulate)" >> /home/rstudio/.Rprofile && \
    echo "use_python('/usr/bin/python3', required = TRUE)" >> /home/rstudio/.Rprofile

