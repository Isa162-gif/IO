# --- Primal ---
f.obj <- c(5,8)
f.con <- matrix(c(2,1,1,3), nrow=2, byrow=TRUE)
f.rhs <- c(12,12)
f.dir <- c(">=",">=")
primal3 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Primal 3 (x,y):", primal3$solution, "\nZ óptimo:", primal3$objval, "\n")

# --- Dual ---
f.obj.dual <- c(12,12)
f.con.dual <- matrix(c(2,1,1,3), nrow=2, byrow=TRUE)
f.rhs.dual <- c(5,8)
f.dir.dual <- c("<=","<=")
dual3 <- lp("max", f.obj.dual, f.con.dual, f.dir.dual, rep(0,2))
cat("Dual 3 (u1,u2):", dual3$solution, "\nW óptimo:", dual3$objval, "\n")

# --- Gráfica Primal ---
x <- seq(0,15,0.1)
y1 <- (12 - 2*x)
y2 <- (12 - x)/3
ggplot() +
  geom_line(aes(x=x,y=y1),color="blue") +
  geom_line(aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,15),ylim=c(0,15)) +
  labs(title="Ejercicio 3: Región factible Primal", x="x", y="y")
