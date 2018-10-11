library(repository)
library(storage)

repo <- repository(memory())
execute_simulation('london_meters.R', repo)

library(browser)
browser_addin(read_artifacts(as_artifacts(repo)))
