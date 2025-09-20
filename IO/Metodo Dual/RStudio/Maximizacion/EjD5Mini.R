f.obj <- c(2,4)
f.con <- matrix(c(1,1,1,2), nrow=2, byrow=TRUE)
f.rhs <- c(6,8)
f.dir <- c(">=",">=")
primal5 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Primal 5 (x,y):", primal5$solution, "\nZ óptimo:", primal5$objval, "\n")

f.obj.dual <- c(6,8)
f.con.dual <- matrix(c(1,1,1,2), nrow=2, byrow=TRUE)
f.rhs.dual <- c(2,4)
f.dir.dual <- c("<=","<=")
dual5 <- lp("max", f.obj.dual, f.con.dual, f.dir.dual, rep(0,2))
cat("Dual 5 (u1,u2):", dual5$solution, "\nW óptimo:", dual5$objval, "\n")

# --- Gráfica Primal ---
x <- seq(0,10,0.1)
y1 <- (6 - x)
y2 <- (8 - x)/2
ggplot() +
  geom_line(aes(x=x,y=y1),color="blue") +
  geom_line(aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,8),ylim=c(0,8)) +
  labs(title="Ejercicio 5: Región factible Primal", x="x", y="y")
