# Use a pre-built R/Shiny image as the base
FROM rocker/shiny:latest
FROM rocker/tidyverse:latest

# Install any additional dependencies
RUN R -e 'install.packages(c("plotly", "shinydashboard"), repos="http://cran.rstudio.com/")'

RUN mkdir -p /srv/shiny-server/myapp

# Copy the Shiny app directory into the container
COPY Modules /srv/shiny-server/myapp
COPY R /srv/shiny-server/myapp
COPY ui.R /srv/shiny-server/myapp
COPY server.R /srv/shiny-server/myapp
COPY global.R /srv/shiny-server/myapp
COPY diamonds.csv /srv/shiny-server/myapp

# Expose port 3838
EXPOSE 3838

# Command to run the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/myapp', host='0.0.0.0', port=3838)"]
