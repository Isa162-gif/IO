f.obj <- c(40, 60)
f.con <- matrix(c(1,1,
                  2,1), nrow=2, byrow=TRUE)
f.rhs <- c(10, 12)
f.dir <- c(">=", ">=")

sol <- lp("min", f.obj, f.con, f.dir, f.rhs)
sol$solution
sol$objval

x <- seq(0, 15, length=200)
y1 <- 10 - x
y2 <- 12 - 2*x

factible <- data.frame(
  x = c(0, 0, 12, 10),
  y = c(12, 10, 0, 0)
)

ggplot() +
  geom_line(aes(x=x, y=y1), color="blue") +
  geom_line(aes(x=x, y=y2), color="red") +
  geom_polygon(data=factible, aes(x=x, y=y), fill="lightgreen", alpha=0.5) +
  geom_point(data=factible, aes(x=x, y=y), size=3, color="black") +
  labs(title="Ejercicio 2: Contenedores", x="x", y="y") +
  coord_cartesian(xlim=c(0,15), ylim=c(0,15))
