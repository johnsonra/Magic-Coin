# find_magic_seed.R
# This code should demonstrate how you found your magic seed and save it to a variable, s

source('is_magic_coin.R')

#######################
# your code goes here #
#######################

# find a random seed such that is_magic_coin() returns TRUE
for(s in 73:1e6)
{
    if(is_magic_coin(s))
    {
        print("Found a magic coin!")
        break
    }
}

# Check your seed, s
is_magic_coin(s)
