f.obj <- c(50, 40)
f.con <- matrix(c(3,2,
                  2,4), nrow=2, byrow=TRUE)
f.rhs <- c(24, 32)
f.dir <- c("<=", "<=")

sol <- lp("max", f.obj, f.con, f.dir, f.rhs)
sol$solution
sol$objval

x <- seq(0, 12, length=200)
y1 <- (24 - 3*x)/2
y2 <- (32 - 2*x)/4

factible <- data.frame(
  x = c(0, 0, 8, 6),
  y = c(0, 8, 4, 3)
)

ggplot() +
  geom_line(aes(x=x, y=y1), color="blue") +
  geom_line(aes(x=x, y=y2), color="red") +
  geom_polygon(data=factible, aes(x=x, y=y), fill="lightpink", alpha=0.5) +
  geom_point(data=factible, aes(x=x, y=y), size=3, color="black") +
  labs(title="Ejercicio 3: Camisas y Pantalones", x="x", y="y") +
  coord_cartesian(xlim=c(0,12), ylim=c(0,12))

