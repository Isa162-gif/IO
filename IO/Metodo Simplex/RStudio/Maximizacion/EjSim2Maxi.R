# Ejercicio 2 - Maximización
library(lpSolve)

f.obj <- c(5, 4)
f.con <- matrix(c(3,2,
                  1,2), nrow=2, byrow=TRUE)
f.rhs <- c(18, 8)
f.dir <- c("<=", "<=")

sol2 <- lp("max", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 2 - Solución (x,y):", sol2$solution, "\n")
cat("Valor óptimo Z =", sol2$objval, "\n")
