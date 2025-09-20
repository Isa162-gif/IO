f.obj <- c(30, 20)
f.con <- matrix(c(3,1,
                  1,2), nrow=2, byrow=TRUE)
f.rhs <- c(15, 12)
f.dir <- c(">=", ">=")

sol <- lp("min", f.obj, f.con, f.dir, f.rhs)
sol$solution
sol$objval

x <- seq(0, 15, length=200)
y1 <- 15 - 3*x
y2 <- (12 - x)/2

factible <- data.frame(
  x = c(0, 0, 12, 5),
  y = c(15, 6, 0, 0)
)

ggplot() +
  geom_line(aes(x=x, y=y1), color="blue") +
  geom_line(aes(x=x, y=y2), color="red") +
  geom_polygon(data=factible, aes(x=x, y=y), fill="lightpink", alpha=0.5) +
  geom_point(data=factible, aes(x=x, y=y), size=3, color="black") +
  labs(title="Ejercicio 3: Materias primas", x="x", y="y") +
  coord_cartesian(xlim=c(0,15), ylim=c(0,15))
