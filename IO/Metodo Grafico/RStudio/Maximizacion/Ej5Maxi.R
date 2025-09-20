f.obj <- c(15, 25)
f.con <- matrix(c(2,1,
                  1,3), nrow=2, byrow=TRUE)
f.rhs <- c(20, 21)
f.dir <- c("<=", "<=")

sol <- lp("max", f.obj, f.con, f.dir, f.rhs)
sol$solution
sol$objval

x <- seq(0, 15, length=200)
y1 <- 20 - 2*x
y2 <- (21 - x)/3

factible <- data.frame(
  x = c(0, 0, 6, 10),
  y = c(0, 7, 5, 0)
)

ggplot() +
  geom_line(aes(x=x, y=y1), color="blue") +
  geom_line(aes(x=x, y=y2), color="red") +
  geom_polygon(data=factible, aes(x=x, y=y), fill="lightcyan", alpha=0.5) +
  geom_point(data=factible, aes(x=x, y=y), size=3, color="black") +
  labs(title="Ejercicio 5: Leche y Pan", x="x", y="y") +
  coord_cartesian(xlim=c(0,15), ylim=c(0,15))
