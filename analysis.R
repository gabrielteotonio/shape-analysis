# Reading Results ----
true_density <- readRDS("data/true_density.RDS")
approx_density <- readRDS("data/approx_density.RDS")
mod_diff <- readRDS("data/mod_diff.RDS")

# Creating Plots ----
plots <- list() 
for (i in 1:7) 
  local({
  df <- data.frame(x = true_density[,i], y = approx_density[,i])
  df.m <- melt(df)
  i <- i
  p <- ggplot(df.m, aes(x=value))+
          geom_density(colour="red", alpha=.3, adjust = 1)+ 
          geom_density(colour="blue", alpha=.3, adjust = 2)+ 
          theme_bw()
  plots[[i]] <<- p
})


grid.arrange(plots[1], plots[2], plots[3],
             plots[4], plots[5], plots[6],
             plots[7])