f.obj <- c(7, 2)
f.con <- matrix(c(1,1,
                  2,3), nrow=2, byrow=TRUE)
f.rhs <- c(10, 18)
f.dir <- c(">=", ">=")

sol2 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 2 - Solución (x,y):", sol2$solution, "\n")
cat("Valor óptimo Z =", sol2$objval, "\n")

# Graficar
x <- seq(0,15,0.1)
y1 <- (10 - x)
y2 <- (18 - 2*x)/3
df <- data.frame(x,y1,y2)

ggplot() +
  geom_line(data=df,aes(x=x,y=y1),color="blue") +
  geom_line(data=df,aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,15), ylim=c(0,15)) +
  labs(title="Ejercicio 2 - Región factible (minimización)", x="x", y="y")
