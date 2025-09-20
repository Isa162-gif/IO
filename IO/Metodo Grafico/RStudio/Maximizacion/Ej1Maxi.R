library(lpSolve)
library(ggplot2)

# Objetivo
f.obj <- c(40, 30)
f.con <- matrix(c(4,2,
                  2,1), nrow=2, byrow=TRUE)
f.rhs <- c(40, 18)
f.dir <- c("<=", "<=")

sol <- lp("max", f.obj, f.con, f.dir, f.rhs)
sol$solution
sol$objval

# Rectas
x <- seq(0, 12, length=200)
y1 <- (40 - 4*x)/2
y2 <- (18 - 2*x)

# Vértices de la región
factible <- data.frame(
  x = c(0, 0, 7, 10),
  y = c(0, 18, 4, 0)
)

ggplot() +
  geom_line(aes(x=x, y=y1), color="blue") +
  geom_line(aes(x=x, y=y2), color="red") +
  geom_polygon(data=factible, aes(x=x, y=y), fill="lightblue", alpha=0.5) +
  geom_point(data=factible, aes(x=x, y=y), size=3, color="black") +
  labs(title="Ejercicio 1: Mesas y Sillas", x="x", y="y") +
  coord_cartesian(xlim=c(0,12), ylim=c(0,20))
