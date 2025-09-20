library(lpSolve)
library(ggplot2)

# Modelo
f.obj <- c(4, 6)
f.con <- matrix(c(2,1,
                  1,1), nrow=2, byrow=TRUE)
f.rhs <- c(8, 5)
f.dir <- c(">=", ">=")

sol1 <- lp("min", f.obj, f.con, f.dir, f.rhs)
cat("Ejercicio 1 - Solución (x,y):", sol1$solution, "\n")
cat("Valor óptimo Z =", sol1$objval, "\n")

# Graficar restricciones
x <- seq(0,10,0.1)
y1 <- (8 - 2*x)     # 2x + y >= 8
y2 <- (5 - x)       # x + y >= 5

df <- data.frame(x,y1,y2)

ggplot() +
  geom_line(data=df,aes(x=x,y=y1),color="blue") +
  geom_line(data=df,aes(x=x,y=y2),color="red") +
  coord_cartesian(xlim=c(0,10), ylim=c(0,10)) +
  labs(title="Ejercicio 1 - Región factible (minimización)", x="x", y="y")
