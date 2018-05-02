###Documenting metadata###
###########################################
setwd("~/Documents/ACCE Data Management/dummy/gapminderRR")
install.packages("gapminder")
list.files()
gapminder::gapminder

#Get the data
install.packages("here")
install.packages("tidyverse")
readr::write_csv(gapminder::gapminder,
                  path= here::here("data/raw/gapminder.csv"))
gapminder_df<- readr::read_csv(here::here("data/raw/gapminder.csv"))
gapminder_df

#Create meta_tbl shell
?create_meta_shell

gapminder_meta_shell<- metadatar::create_meta_shell(data.frame(gapminder_df), 
                                                     factor_cols = c("country", "continent"))
write.csv(gapminder_meta_shell, file = here::here("data/metadata/gapminder_meta_shell.csv"), 
          row.names = F)

#Applying conventions to our project
install.packages(c("devtools", "usethis"))
usethis::use_r("gapminder_process")
