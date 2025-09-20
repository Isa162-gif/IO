f.obj <- c(3, 5)
f.con <- matrix(c(1,2,
                  2,1), nrow=2, byrow=TRUE)
f.rhs <- c(8, 6)
f.dir <- c(">=", ">=")

sol4 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 4 - Solución (x,y):", sol4$solution, "\n")
cat("Valor óptimo Z =", sol4$objval, "\n")

# Graficar
x <- seq(0,15,0.1)
y1 <- (8 - x)/2
y2 <- (6 - 2*x)
df <- data.frame(x,y1,y2)

ggplot() +
  geom_line(data=df,aes(x=x,y=y1),color="blue") +
  geom_line(data=df,aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,15), ylim=c(0,15)) +
  labs(title="Ejercicio 4 - Región factible (minimización)", x="x", y="y")
