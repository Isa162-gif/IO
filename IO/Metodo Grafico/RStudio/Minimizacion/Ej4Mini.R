f.obj <- c(10, 15)
f.con <- matrix(c(1,1,
                  2,1), nrow=2, byrow=TRUE)
f.rhs <- c(8, 10)
f.dir <- c(">=", ">=")

sol <- lp("min", f.obj, f.con, f.dir, f.rhs)
sol$solution
sol$objval

x <- seq(0, 12, length=200)
y1 <- 8 - x
y2 <- 10 - 2*x

factible <- data.frame(
  x = c(0, 0, 10, 8),
  y = c(10, 8, 0, 0)
)

ggplot() +
  geom_line(aes(x=x, y=y1), color="blue") +
  geom_line(aes(x=x, y=y2), color="red") +
  geom_polygon(data=factible, aes(x=x, y=y), fill="khaki", alpha=0.5) +
  geom_point(data=factible, aes(x=x, y=y), size=3, color="black") +
  labs(title="Ejercicio 4: Agua y Jugo", x="x", y="y") +
  coord_cartesian(xlim=c(0,12), ylim=c(0,12))
