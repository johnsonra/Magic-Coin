
#' Check a random seed to see if it has magical properties
#' 
#' @param rseed An integer to be passed to set.seed()
#' @return Returns TRUE if rseed results in 20 or more heads from flipping a pseudo-random coin
#' @examples 
#' is_magic_coin(392487)
is_magic_coin <- function(rseed)
{
    set.seed(rseed)
    
    flips <- runif(10) > 0.5 # flip 10 coins
    all(flips)               # are they all heads?
}
