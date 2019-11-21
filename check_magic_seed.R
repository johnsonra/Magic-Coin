# check_magic_seed.R
# This code checks the seed found in find_magic_seed.R

# ** don't edit this file ** #

## load functions we need
source('is_magic_coin.R')


## run code in find_magic_seed
source('find_magic_seed.R')


## check if s results in 10 consecutive heads
if(!is_magic_coin(s))
    stop('Sorry, no magic - try again.')


## check if the s is unique or if it has already in the hall of fame

HoF <- readLines('README.md')                    # pull all lines from README
HoF <- grep(HoF, pattern = '^\\|', value = TRUE) # get rows of table at the end (they start with '|') %>%
HoF <- strsplit(HoF, '\\|')                      # split columns on '|'
HoF <- sapply(HoF, `[`, 3)                       # third value is seed
HoF <- as.numeric(HoF)                           # convert to numeric
    
if(!s %in% HoF) # if s is unique to previously reported seeds, add to the hall of fame
{
    # append new seed to README
    system(paste0("echo '|${{github.actor}}|", s, "|' >> README.md"))
}