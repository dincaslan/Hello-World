library(tidyverse)
library(lubridate)

ny_func <- function() 
{
  year <- year(today())
  month <- month(today())
  dat <- mday(today())
  n_year <- year+1
  if (dat==31 && month ==12) {
    message <- cat("See you next year :P \nGoodbye", year, ", Welcome", n_year, "!")
  } else  {
    message <- print("Work hard, play hard") 
  }
  return(message)
}

#alternatively
ny_fun <- function() 
{
  ifelse (mday(today()) == 31 && month(today()) == 12 , cat("See you next year :P \nGoodbye", year(today()), ", Welcome", year(today())+1, "!") , print("Work hard, play hard"))
}