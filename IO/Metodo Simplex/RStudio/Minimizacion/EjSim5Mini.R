f.obj <- c(2, 4)
f.con <- matrix(c(1,1,
                  1,2), nrow=2, byrow=TRUE)
f.rhs <- c(6, 8)
f.dir <- c(">=", ">=")

sol5 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 5 - Solución (x,y):", sol5$solution, "\n")
cat("Valor óptimo Z =", sol5$objval, "\n")

# Graficar
x <- seq(0,15,0.1)
y1 <- (6 - x)
y2 <- (8 - x)/2
df <- data.frame(x,y1,y2)

ggplot() +
  geom_line(data=df,aes(x=x,y=y1),color="blue") +
  geom_line(data=df,aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,15), ylim=c(0,15)) +
  labs(title="Ejercicio 5 - Región factible (minimización)", x="x", y="y")
