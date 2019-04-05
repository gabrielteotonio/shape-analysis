# Gamma's f(x) ----
gamma_density <- function(x, alpha, beta) {
  (beta^alpha)/gamma(alpha) * x^(alpha - 1) * exp(-beta*x) 
}

# Gamma's Estimated Function ----
gamma_hat <- function(alpha) {
  sqrt(2*pi) * alpha^(alpha - 1/2) * exp(-alpha)
}

# Gamma's Saddlepoint Density ----
gamma_saddle_density <- function(x, alpha, beta) {
  gamma(alpha)/gamma_hat(alpha) * gamma_density(x, alpha, beta)
}