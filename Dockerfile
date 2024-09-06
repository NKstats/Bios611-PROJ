
FROM rocker/rstudio

# Update the package list and install man-db to restore man pages
RUN apt update && apt install -y man-db && yes | unminimize && rm -rf /var/lib/apt/lists/*
