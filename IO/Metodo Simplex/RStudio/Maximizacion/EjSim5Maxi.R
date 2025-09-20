# Ejercicio 5 - Maximización
library(lpSolve)

f.obj <- c(20, 10)
f.con <- matrix(c(2,1,
                  1,1), nrow=2, byrow=TRUE)
f.rhs <- c(10, 6)
f.dir <- c("<=", "<=")

sol5 <- lp("max", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 5 - Solución (x,y):", sol5$solution, "\n")
cat("Valor óptimo Z =", sol5$objval, "\n")
