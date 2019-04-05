# Parameters ----
parameters <- data.frame(
  c(1, 2),
  c(2, 2),
  c(3, 2),
  c(5, 1),
  c(9, .5),
  c(7.5, 1),
  c(.5, 1)
)

# Variables ----
N <- 19801
x <- c()
true_density <- matrix(0, nrow=N, ncol=dim(parameters)[2])
approx_density <- matrix(0, nrow=N, ncol=dim(parameters)[2])
mod_diff <- matrix(0, nrow=N, ncol=dim(parameters)[2])
cont2 = 1
cont = 1

# Loop ----
for (j in parameters) {
  x <- c(seq(0.01,1,0.00005))
  for (i in x) {
    true_density[cont2, cont] <- gamma_density(i, j[1], j[2])
    approx_density[cont2, cont] <- gamma_saddle_density(i, j[1], j[2])
    mod_diff[cont2, cont] <- abs(gamma_density(i, j[1], j[2]) - gamma_saddle_density(i, j[1], j[2]))
    cont2 = cont2 + 1  
  }
  cont = cont + 1
  cont2 = 1
}

# Setting Dataframe Structure ----
true_density <- as.data.frame(true_density)
approx_density <- as.data.frame(approx_density)
mod_diff <- as.data.frame(mod_diff)

for (i in 1:7) {
  names(true_density)[i] <- paste("scenario", i)
  names(approx_density)[i] <- paste("scenario", i)
  names(mod_diff)[i] <- paste("scenario", i)
}

# Writing .RDS's
saveRDS(true_density, "data/true_density.RDS")
saveRDS(approx_density, "data/approx_density.RDS")
saveRDS(mod_diff, "data/mod_diff.RDS")