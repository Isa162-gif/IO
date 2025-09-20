# --- Primal ---
f.obj <- c(7,2)
f.con <- matrix(c(1,1,2,3), nrow=2, byrow=TRUE)
f.rhs <- c(10,18)
f.dir <- c(">=",">=")
primal2 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Primal 2 (x,y):", primal2$solution, "\nZ óptimo:", primal2$objval, "\n")

# --- Dual ---
f.obj.dual <- c(10,18)
f.con.dual <- matrix(c(1,2,1,3), nrow=2, byrow=TRUE)
f.rhs.dual <- c(7,2)
f.dir.dual <- c("<=","<=")
dual2 <- lp("max", f.obj.dual, f.con.dual, f.dir.dual, rep(0,2))
cat("Dual 2 (u1,u2):", dual2$solution, "\nW óptimo:", dual2$objval, "\n")

# --- Gráfica Primal ---
x <- seq(0,15,0.1)
y1 <- (10 - x)
y2 <- (18 - 2*x)/3
ggplot() +
  geom_line(aes(x=x,y=y1),color="blue") +
  geom_line(aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,15),ylim=c(0,15)) +
  labs(title="Ejercicio 2: Región factible Primal", x="x", y="y")
