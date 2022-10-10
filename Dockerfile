
# Example shiny app docker file
# https://blog.sellorm.com/2021/04/25/shiny-app-in-docker/

# get shiny server and R from the rocker project
FROM rocker/shiny:4.0.5

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev
  

# install R packages required 
# (change it depending on the packages you need)
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"


# copy the app directory into the image
COPY ./* /srv/shiny-server/

# run app
CMD ["/usr/bin/shiny-server"]


# CMD ["R -e "shiny::runApp('app.R', port = 3838)""]