# Ejercicio 1 - Maximización
library(lpSolve)

f.obj <- c(3, 5)  # función objetivo
f.con <- matrix(c(1,1,
                  1,2), nrow=2, byrow=TRUE)
f.rhs <- c(4, 5)
f.dir <- c("<=", "<=")

sol1 <- lp("max", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 1 - Solución (x,y):", sol1$solution, "\n")
cat("Valor óptimo Z =", sol1$objval, "\n")
