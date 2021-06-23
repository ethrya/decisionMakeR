plot_dist <- function(params){
   tibble(x = seq(-3, 3, 0.1),
          pdf = dnorm(x, params[1],
                      params[2])) %>%
      ggplot(aes(x = x, y = pdf)) +
      geom_line(size = 1)
}

get_params <- function(params){
   strsplit(params, ",") %>%
      magrittr::extract2(1) %>%
      str_extract("[\\-\\.0-9]+") %>%
      as.numeric()
}

# x <- paste(paramNames, "=", paramVals) %>%
#   paste(collapse = ", ")
# 
# 
# eval(ensym(!!x))
# 
# dnorm(seq(-3,3,  0.1), ensym(x))


# do.call(ggfortify::ggdistribution, setName(list(c(dnorm, c(seq(-3, 3, 0.1)), paramVals))))
#         
#         
# as.list(c(2, c(3, 4)))
#         