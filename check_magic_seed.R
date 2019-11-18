# check_magic_seed.R
# This code checks the seed found in find_magic_seed.R

# ** don't edit this file ** #

source('find_magic_seed.R')

if(!is_magic_coin(s))
    stop('Sorry, no magic - try again.')
