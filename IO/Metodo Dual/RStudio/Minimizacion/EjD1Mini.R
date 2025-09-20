library(lpSolve)
library(ggplot2)

# --- Primal ---
f.obj <- c(4,6)
f.con <- matrix(c(2,1,1,1), nrow=2, byrow=TRUE)
f.rhs <- c(8,5)
f.dir <- c(">=",">=")
primal1 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Primal 1 (x,y):", primal1$solution, "\nZ óptimo:", primal1$objval, "\n")

# --- Dual ---
f.obj.dual <- c(8,5)
f.con.dual <- matrix(c(2,1,1,1), nrow=2, byrow=TRUE)
f.rhs.dual <- c(4,6)
f.dir.dual <- c("<=","<=")
dual1 <- lp("max", f.obj.dual, f.con.dual, f.dir.dual, rep(0,2))
cat("Dual 1 (u1,u2):", dual1$solution, "\nW óptimo:", dual1$objval, "\n")

# --- Gráfica Primal ---
x <- seq(0,10,0.1)
y1 <- (8 - 2*x)
y2 <- (5 - x)
ggplot() +
  geom_line(aes(x=x,y=y1),color="blue") +
  geom_line(aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,10),ylim=c(0,10)) +
  labs(title="Ejercicio 1: Región factible Primal", x="x", y="y")
