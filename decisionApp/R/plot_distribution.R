plot_dist <- function(params){
   tibble(x = seq(-5, 5, 0.1),
          pdf = (dt(x/params[2] - params[1], params[3]))) %>%
      ggplot(aes(x = x, y = pdf)) +
      geom_line(size = 1)
}

get_params <- function(params){
   strsplit(params, ",") %>%
      magrittr::extract2(1) %>%
      str_extract("[\\-\\.0-9]+") %>%
      as.numeric()
}