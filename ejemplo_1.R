# Cargamos los datos
data(mtcars)
attach(mtcars)

# Tabla de frecuencias
mi_tabla <- table(cyl)
mi_tabla


# Una fila, dos columnas
par(mfrow = c(1, 2))

# Gráfico de barras de frecuencia absoluta
barplot(mi_tabla, main = "Frequencia absoluta",
        col = rainbow(3))

# Gráfico de barras de frecuencia relativa
barplot(prop.table(mi_tabla) * 100, main = "Frequencia relativa (%)",
        col = rainbow(3))

par(mfrow = c(1, 1))
plot(factor(mtcars$cyl), col = rainbow(3))


barp <- barplot(mi_tabla,                     # Guarda los valores de X que
                main = "Frequencia absoluta", # representan el centro de 
                col = rainbow(3))             # cada barra           

lines(barp, c(5, 4, 12), type = "o", lwd = 3)

# Título, etiquetas y colores del gráfico de barras

barplot(mi_tabla,                               # Datos
        main = "Gráfico de barras",             # Título
        xlab = "Número de cilindros",           # Etiqueta del eje X
        ylab = "Frecuencia",                    # Etiqueta del eje Y
        border = "black",                       # Color del borde de las barras
        col = c("darkgrey", "darkblue", "red")) # Color para cada barra



