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
  p <- ggplot(df.m, aes(x = value, color = variable)) +
          geom_density(alpha=.3) +
          labs(title = paste("Scenario", i),
               x = "x",
               y = "Density") +
          scale_color_discrete(name = "Density", labels = c("True", "Saddlepoint")) +
          theme_bw()
  plots[[i]] <<- p
})


plots[i] # Change i to obtain the results