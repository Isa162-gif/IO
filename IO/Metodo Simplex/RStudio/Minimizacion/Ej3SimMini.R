f.obj <- c(5, 8)
f.con <- matrix(c(2,1,
                  1,3), nrow=2, byrow=TRUE)
f.rhs <- c(12, 12)
f.dir <- c(">=", ">=")

sol3 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 3 - Solución (x,y):", sol3$solution, "\n")
cat("Valor óptimo Z =", sol3$objval, "\n")

# Graficar
x <- seq(0,15,0.1)
y1 <- (12 - 2*x)
y2 <- (12 - x)/3
df <- data.frame(x,y1,y2)

ggplot() +
  geom_line(data=df,aes(x=x,y=y1),color="blue") +
  geom_line(data=df,aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,15), ylim=c(0,15)) +
  labs(title="Ejercicio 3 - Región factible (minimización)", x="x", y="y")
