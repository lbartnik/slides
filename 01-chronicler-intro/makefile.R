setwd('01-chronicler-intro/')

library(repository)
library(storage)

repo <- repository(filesystem('repository', create = TRUE))
execute_simulation('london_meters.R', repo)

library(browser)
browser_addin(read_artifacts(as_artifacts(repo)))

library(search)
identify_file('01.png', repo)
identify_file('02.png', repo)
identify_file('03.png', repo)


library(png)
library(jsonlite)
library(imager)
library(utilities)

distm <- distmatrix(list.files(pattern = '0[1-3].png'), repo)

