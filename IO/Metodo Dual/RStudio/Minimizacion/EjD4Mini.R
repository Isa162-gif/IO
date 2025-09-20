f.obj <- c(3,5)
f.con <- matrix(c(1,2,2,1), nrow=2, byrow=TRUE)
f.rhs <- c(8,6)
f.dir <- c(">=",">=")
primal4 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Primal 4 (x,y):", primal4$solution, "\nZ óptimo:", primal4$objval, "\n")

f.obj.dual <- c(8,6)
f.con.dual <- matrix(c(1,2,2,1), nrow=2, byrow=TRUE)
f.rhs.dual <- c(3,5)
f.dir.dual <- c("<=","<=")
dual4 <- lp("max", f.obj.dual, f.con.dual, f.dir.dual, rep(0,2))
cat("Dual 4 (u1,u2):", dual4$solution, "\nW óptimo:", dual4$objval, "\n")

# --- Gráfica Primal ---
x <- seq(0,15,0.1)
y1 <- (8 - x)/2
y2 <- (6 - 2*x)
ggplot() +
  geom_line(aes(x=x,y=y1),color="blue") +
  geom_line(aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,15),ylim=c(0,10)) +
  labs(title="Ejercicio 4: Región factible Primal", x="x", y="y")
