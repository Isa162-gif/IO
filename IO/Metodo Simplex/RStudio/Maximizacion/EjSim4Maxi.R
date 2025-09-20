# Ejercicio 4 - Maximización
library(lpSolve)

f.obj <- c(40, 30)
f.con <- matrix(c(4,2,
                  2,1), nrow=2, byrow=TRUE)
f.rhs <- c(40, 18)
f.dir <- c("<=", "<=")

sol4 <- lp("max", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 4 - Solución (x,y):", sol4$solution, "\n")
cat("Valor óptimo Z =", sol4$objval, "\n")
