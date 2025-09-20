library(lpSolve)
library(ggplot2)

# Objetivo
f.obj <- c(50, 70)
f.con <- matrix(c(2,1,
                  1,2), nrow=2, byrow=TRUE)
f.rhs <- c(20, 20)
f.dir <- c(">=", ">=")

sol <- lp("min", f.obj, f.con, f.dir, f.rhs)
sol$solution
sol$objval

# Rectas
x <- seq(0, 20, length=200)
y1 <- (20 - 2*x)
y2 <- (20 - x)/2

# Vértices factibles
factible <- data.frame(
  x = c(0, 0, 20, 10),
  y = c(20, 10, 0, 0)
)

ggplot() +
  geom_line(aes(x=x, y=y1), color="blue") +
  geom_line(aes(x=x, y=y2), color="red") +
  geom_polygon(data=factible, aes(x=x, y=y), fill="lightblue", alpha=0.5) +
  geom_point(data=factible, aes(x=x, y=y), size=3, color="black") +
  labs(title="Ejercicio 1: Transporte A y B", x="x", y="y") +
  coord_cartesian(xlim=c(0,20), ylim=c(0,20))
