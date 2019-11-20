# check_magic_seed.R
# This code checks the seed found in find_magic_seed.R

# ** don't edit this file ** #

## load libraries and functions we need
if(!require(magrittr))
{
    install.packages('magrittr', repos = 'https://demo.rstudiopm.com/all/__linux__/bionic/latest')
    library(magrittr)
}

source('is_magic_coin.R')


## run code in find_magic_seed
source('find_magic_seed.R')


## check if s results in 10 consecutive heads
if(!is_magic_coin(s))
    stop('Sorry, no magic - try again.')


## check if the s is unique or if it has already in the hall of fame

HoF <- readLines('README.md') %>%               # pull all lines from README
       grep(pattern = '^\\|', value = TRUE) %>% # get rows of table at the end (they start with '|') %>%
       strsplit('\\|') %>%                      # split columns on '|'
       sapply(`[`, 3) %>%                       # third value is seed
       as.numeric()
    
if(!s %in% HoF) # if s is unique to previously reported seeds, add to the hall of fame
{
    # append new seed to README
    ghID <- system("${{github.actor}}", intern = TRUE)
    
    paste0("echo '|", ghID, "|", s, "|' >> README.md") %>%
        system()
    
    # set flag to push README update
    system('export HOF="True"')
}