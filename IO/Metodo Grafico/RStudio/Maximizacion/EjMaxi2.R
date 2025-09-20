f.obj <- c(25, 30)
f.con <- matrix(c(2,1,
                  1,2), nrow=2, byrow=TRUE)
f.rhs <- c(16, 14)
f.dir <- c("<=", "<=")

sol <- lp("max", f.obj, f.con, f.dir, f.rhs)
sol$solution
sol$objval

x <- seq(0, 10, length=200)
y1 <- 16 - 2*x
y2 <- (14 - x)/2

factible <- data.frame(
  x = c(0, 0, 4, 8),
  y = c(0, 7, 6, 0)
)

ggplot() +
  geom_line(aes(x=x, y=y1), color="blue") +
  geom_line(aes(x=x, y=y2), color="red") +
  geom_polygon(data=factible, aes(x=x, y=y), fill="lightgreen", alpha=0.5) +
  geom_point(data=factible, aes(x=x, y=y), size=3, color="black") +
  labs(title="Ejercicio 2: Pan y Pasteles", x="x", y="y") +
  coord_cartesian(xlim=c(0,10), ylim=c(0,10))

