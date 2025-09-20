# Ejercicio 3 - Maximización
library(lpSolve)

f.obj <- c(2, 3)
f.con <- matrix(c(1,3,
                  2,1), nrow=2, byrow=TRUE)
f.rhs <- c(9, 8)
f.dir <- c("<=", "<=")

sol3 <- lp("max", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 3 - Solución (x,y):", sol3$solution, "\n")
cat("Valor óptimo Z =", sol3$objval, "\n")
