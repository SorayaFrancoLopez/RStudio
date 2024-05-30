


## Introducción al programa R

# El programa R funciona con una ventana donde se escriben los comandos m´as 
# una ventana donde aparecen los gr´aficos que se van creando. Podemos
# empezar por dar un comando que haga aparecer la ventana de los gráficos:
  
plot(rnorm(1000))


# Con este comando aparecer´a un gr´afico con mil muestras de una variable
  # aleatoria con distribuci´on normal. El comando rnorm(1000) crea la muestra
  # (random normal, o sea, normal aleatoria), mientras que el comando plot() crea 
  # el gr´afico en la ventana propia (m´as tarde veremos como guardar gr´aficos en archivos).

### Una calculadora

# El programa R puede funcionar simplemente como una potente calculadora. 
  # Dispone de todas las funciones matem´aticas usuales:
  
  
  
2+2
log(1+sin(pi/4)) 
rnorm(8) 


# Despu´es de cada uno de los comandos que damos, R nos presenta la respuesta.
# En el caso de plot() no hay respuesta en la ventana de comandos. 
# En los ultimos´ 3 comandos obtenemos una respuesta num´erica. Los dos primeros
# son n´umeros reales, el [1] inicial indica que es un vector con una
# componente (o sea, un n´umero). El ´ultimo nos da un vector de 8 componentes. 
# En la primera l´ınea de la respuesta, el [1] indica que el primer n´umero 
# de esa l´ınea es la componente 1 del vector; en la segunda l´ınea, 
# el [6] indica que el primer n´umero es la componente 6 del vector 
# (las dos ´ultimas componentes no caben en la primera l´ınea, por esa raz´on 
# R las desplaza a la segunda; esto puede ser diferente dependiendo del tama˜no 
# de la ventana de R que se tenga).

### Variables
# Una de las caracter´ısticas indispensables de R es el uso de variables. 
  # En la mayor´ıa de las computaciones que hacemos, en alg´un momento 
  # necesitamos guardar valores en memoria para usarlos m´as tarde en otras 
  # expresiones. Para este efecto creamos variables. Las variables tienen un nombre
  # que nosotros elegimos. Por ejemplo, el comando



x <- 5
esto.es.una.variable1 <- 45 
esto.es.una.2avariable <- 34


# Crea la variable x con el valor 5. Los nombres de las variables no
# pueden empezar por un d´ıgito ni por un punto seguido de un d´ıgito
# (pueden empezar por un punto seguido de una letra, pero no es conveniente
# hacerlo pues estos nombres reflejan variables especiales del sistema). Sin embargo,
# pueden contener tanto d´ıgitos como puntos en el medio:
  
#   Ciertos nombres est´an reservados por R y no se pueden redefinir. 
# Algunos casos susceptibles de crear dolores de cabeza son los nombres 
# con una sola letra c, q, t, C, D, F, I y T, pero tambi´en diff, df y pt. Por supuesto,
# los nombres de las funciones usuales sin, cos, etc. tampoco se pueden usar 
# para variables. El sistema es sensible al uso de may´usculas y min´usculas:
  
  
una.variable <- 4 
una.Variable <- 10
una.Variable


# Las variables una.variable y una.Variable son diferentes. 

### Vectores 

# La mayor´ıa de los objetos con los que trabajaremos en R son vectores, los
# n´umeros son interpretados como vectores de una componente, como hemos visto. 
# Una forma sencilla de construir un vector es con el operador de con-
#   catenaci´on c(...):
  
  
  
peso <- c(60, 72, 84, 65, 43, 87, 90, 56)
peso


# Estos n´umeros son un ejemplo, pero podr´ıan representar el peso de un 
# conjunto de personas. Veremos un poco m´as adelante como obtener datos de
# un fichero. El comando length() nos da la longitud de un vector:
  
  
  
length(peso)


  # Los elementos de los vectores tambien se pueden acceder individualmente 
  # con el ´ındice de orden:
  
  
peso[4]


  # Se pueden hacer c´ alculos con vectores de la misma longitud. Imag´ınense que
  # disponemos tambi´en de los datos de las alturas de las mismas personas y
  # que queremos calcular el ´ındice de masa corporal (imc) para cada persona,
  # dado por el cociente entre el peso (en Kg) y el cuadrado de la altura (en m):
  
  
altura <- c(1.59, 1.75, 1.85, 1.60, 1.57, 1.90, 1.83, 1.73)
imc <- peso/altura^2
imc



# Se deben notar dos detalles. El primero es que en el vector de alturas,
# las partes decimales est´an separadas de la parte entera por un punto “.” y no
# por una coma “,”. El otro es que la divisi´on de dos vectores se efect´ua 
# componente a componente (siempre que los vectores tengan la misma longitud),
# o sea, la primera componente de imc es 60/1,592. Cuando se efect´ua una 
# operaci´on entre un n´umero (un vector de longitud 1) y otro vector, 
# el resultado es un vector en el cual cada componente es el resultado de 
# la operaci´on entre dicho n´umero y cada componente del vector original, por ejemplo:
  
  
altura <- c(1.59, 1.75, 1.85, 1.60, 1.57, 1.90, 1.83, 1.73)
imc <- peso/altura^2
imc


# Se deben notar dos detalles. El primero es que en el vector de alturas, 
# las partes decimales est´an separadas de la parte entera por un punto “.” y no
# por una coma “,”. El otro es que la divisi´on de dos vectores se efect´ua 
# componente a componente (siempre que los vectores tengan la misma longitud), 
# o sea, la primera componente de imc es 60/1,592. Cuando se efect´ua una 
# operaci´on entre un n´umero (un vector de longitud 1) y otro vector, 
# el resultado es un vector en el cual cada componente es el resultado de la operaci´on
# entre dicho n´umero y cada componente del vector original, por ejemplo:
  
  
altura + 4
peso * 3


# La funci´on sum() da la suma de todos los elementos de un vector:
  
  
sum(peso)


# Podemos calcular la media de una muestra de esta forma 


sum(peso)/length(peso)


# Usando la fórmula $v_x=\frac{1}{n}\sum_{i=1}^{n}(x_i-\bar{x})^2$ calculamos las varianza.



peso.bar <- sum(peso)/length(peso)
peso.bar
sum((peso - peso.bar)^2)/length(peso)


# Claro que, siendo R un programa dise˜nado para la estad´ıstica, ya existen
# funciones para calcular estos valores:
  
  
mean(peso)
var(peso)

# Hay una diferencia entre el valor de la varianza que calculamos con la
# f´ ormula $v_x=\frac{1}{n}\sum_{i=1}^{n}(x_i-\bar{x})^2$ , 
#  y el valor dado por la funci´on var(). Esto se debe a que esta funci´on calcula 
# $s_{x}^{2}=\frac{1}{n-1}\sum_{i=1}^{n}(x_i-\bar{x})^2$ 
  # An´alogamente, la desviaci´on t´ıpica (standard deviation en ingl´es) se 
  # calcula con sd(), pero esto nos da la versi´on
# $s=\sqrt{s_{x}^{2}}=\sqrt{\frac{1}{n-1}\sum_{i=1}^{n}(x_i-\bar{x})^2}$
  
  
  
sd(peso) 
sqrt(var(peso))


# La function summary() nos da un resumen de la distribuici´on de los datos de peso


summary(peso)


# Hay que tener en cuenta c´ omo calcula R los cuartiles, que no es igual a como
# lo hicimos en clase. Si la muestra ordenada tiene n datos, x1, x2, . . . , xn, 
# entonces el primer dato, $x_1$ , es el 0 $“(n−1)-til”$, $x_2$ es el 1 $(n−1)-til$, 
# etc. $x_i$ es el $(i − 1)$ $“(n − 1)-til”$, $x_n$ es el $(n − 1)$ $“(n − 1)-til”$.
# Dicho de otra forma, $x_i$ es la fración $(i − 1)/(n− 1)$ 
# de la distribuición. Veamos en el caso de los pesos como se ordena la muestra:
  
  
sort(peso)


# El dato 43 es el 0 (o sea el m´ınimo), 56 es el 1/7 
  # (la muestra tiene 8 elementos, luego n−1 = 7) y 60 es el 2/7 = 0.2857. 
  # Para calcular el primer cuartil (que es la fracci´on 1/4 de la muestra ordenada), 
  # R hace una interpolaci´on lineal entre el "n − 1-til" inmediatamente anterior y 
  # el inmediatamente posterior a 1/4, o sea, como 1/4 = 0,25 · (1/7) + 0,75 · (2/7), 
  # el primer cuartil es Q1 = 0,25 · 56 + 0,75 · 60 = 59. El tercer cuartil es calculado 
  # de forma an´aloga. (Siempre que se quiera obtener informaci´on sobre un comando, se puede
  # usar la funci´on help():
  # print(help(sort))
  # que nos da como respuesta la discripci´on completa del comando sort(); 
  # son varias p´aginas de informaci´on por las que se puede navegar con las teclas
  # “u” (up) o “d” (down); para salir de la ayuda se usa la tecla “q” (quit)). 
  # Los comandos cov(x,y) y cor(x,y) calculan la covarianza y el coeficiente 
  # de correlaci´on r entre x y y. Tambi´en se puede construir un diagrama de
  # tallos y hojas con el comando stem() (¡Pruebe por ejemplostem(altura))


stem(altura)


#### Ejercicio 1

# Los datos de la siguiente tabla representan los goles de David Villa en 
# La Liga y en la copa desde la temporada 2000-01: 

# Temporada ’00 ’01 ’02 ’03 ’04 ’05 ’06 ’07 ’08
# Nº de partidos 36 44 40 46 46 40 49 41 40 
# Nº de goles 13 20 20 20 20 28 21 22 31

# Introduzca estos datos en variables apropiadas y calcule la media, varianza, 
# desviaci´on t´ıpica y mediana para cada una de ellas. 
# Calcule la covarianza y el coeficiente de correlaci´on entre los partidos 
# jugados y goles marcados.

# Cargamos los datos en variables
temporada <- c('00','01','02','03','04','05','06','07','08')
partidos <- c(36,44,40,46,46,40,49,41,40) 
goles <- c(13,20,20,20,20,28,21,22,31)
# Calculamos estadísticos descriptivos para cada variable

# Media de partidos
mean(partidos) 
# Varianza de partidos 
var(partidos)
# Desviación típica de partidos
sd(partidos) 
# Mediana de partidos
median(partidos)
# Media de goles
mean(goles)
# Varianza de goles
var(goles) 
# Desviación típica de goles
sd(goles)
# Mediana de goles 
median(goles)
# Covarianza entre partidos y goles
cov(partidos, goles)
# Coeficiente de correlación entre partidos y goles
cor(partidos, goles)



#######################con PURR #################
library(purrr)
df<- data.frame(temporada=c(2000:2008), 
                npartidos=c(36, 44, 40, 46, 46, 40, 49, 41, 40), 
                ngoles=c(13, 20, 20, 20, 20, 28, 21, 22, 31))
head(df)
#library(tidyverse)
map(df[,-1], mean)
map(df[,-1], var)
map(df[,-1], sd)
map(df[,-1], median)

cov(df$npartidos, df$ngoles)
cor(df$npartidos, df$ngoles)

####### otra con purr

# Calculamos estadísticos descriptivos para cada vector usando map()
estadisticos <- map(df, ~c(
  media = mean(.),
  varianza = var(.),
  desv_tipica = sd(.),
  mediana = median(.)  
))
estadisticos

# Calculamos covarianza y correlación entre partidos y goles
cov(partidos, goles)
cor(partidos, goles)




### 1.5 Gráficos

# Vimos ya como crear un gr´afico con el comando plot(). Podemos igualmente crear 
# histogramas (diagramas de barras) y diagramas de caja y bigotes:
  
  
hist(peso)
boxplot(altura)


# En el diagrama de caja y bigotes, los bigotes (las l´ıneas horizontales conectadas
# a la caja por un trazo discontinuo) no marcan el m´aximo y el m´ınimo de la muestra 
# sino el mayor y menor de los datos que quedan a una distancia de la mediana menor
# o igual que 1.5 veces el tama˜no de la caja (que es Q3 −Q1). Si hay datos fuera de
# estos valores se consideran at´ıpicos y se se˜nalan con un c´ırculo. 
# Para ver este efecto pruebe lo siguiente:
  
  
x <- c(1, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 24, 25) 
boxplot(x)

# Para crear un diagrama de dispersi´ on entre los datos que tenemos de peso
# y altura damos el comando



plot(peso,altura)


# Para crear un diagrama de dispersi´ on entre los datos que tenemos de peso
# y altura damos el comando



plot(peso,altura)

#  El gr´afico que estaba antes desaparece y aparece uno nuevo con los datos 
# (peso, altura) marcados por c´ırculos. Se pueden controlar todos los aspectos 
# del gr´afico: ejes, leyendas, etc. Vamos simplemente a indicar como cambiar 
# algunos detalles. Para cambiar la forma de como se presentan los puntos en 
# el g´rafico se usa el argumento pch=n donde n es un entero entre 1 y 26; a 
# cada número corresponde un s´ımbolo diferente, por ejemplo, con n=3 se
# obtiene un “+”:
  
  
plot(peso,altura, pch=3, col="red")


# Se comprueba facilmente a que corresponden los otros n´umeros. 
  # Tambi´en se puede usar la opci´on pch="c" donde c es un caracter cualquiera. 
  # En este caso en lugar de un s´ımbolo aparece el caracter c (pru´ebalo). Para cambiar
  # el t´ıtulo del gr´afico se usa la opci´on main="...", por ejemplo


plot(peso, altura, pch=3, 
     main="El peso y la altura de los alumnos de CC.AA.")


# N´otese que cuando cambiamos de l´ınea sin que el comando est´e 
# terminado, R espera que introduzcamos el resto del comando en la 
# l´ınea siguiente (delante del s´ımbolo “+”). Finalmente, se puede
# cambiar la leyenda que aparece en
# los ejes con xlab="..." y ylab="...",



plot(peso, altura, pch=3, 
     main="El peso y la altura de los alumnos de CC.AA.")
abline(1.4, 0.005, col="red")

# El orden de las opciones es irrelevante, simplemente deben venir
# despu´es de los vectores de datos. El comando abline(a,b) a˜nade al gr´afico la l´ınea
# recta de ecuaci´on y = a + bx:

# Para a˜nadir l´ıneas horizontales o verticales se usa el mismo comando,
# pero con otro formato:
  
  
  
plot(peso, altura, pch=3, 
       main="El peso y la altura de los alumnos de CC.AA.")
abline(v=80, col="green") 
abline(h=mean(altura), col="blue")


# Cuando estamos satisfechos con el resultado del gr´afico podemos guardalo 
# en un fichero. La forma de hacerlo es decir a R que en vez de enviar los 
# comandos que generan el gr´afico a la pantalla, los env´ıe a un fichero. 
# El comando que se usa depende de que tipo de fichero queremos crear. 
# El comando jpeg("mi_grafico.jpeg") crea el archivo mi grafico.jpeg, 
# pero no con el gr´afico ya creado. Despu´es de dado este comando tenemos 
# que repetir los comandos que crearon el gr´afico. Para terminar de escribir 
# en el fichero mi grafico.jpeg tenemos que decir a R que vuelva a la pantalla 
# gr´afica con dev.off(). La secuencia completa de comandos ser´ıa:
  
  
plot(peso,altura, pch=3, xlab="Peso (en Kg)",
       ylab="Altura (en m)",
       main="El peso y la altura de los alumnos de CC.AA.")
abline(1.4, 0.005)
abline(v=80)
abline(h=mean(altura))




#### Ejercicio 2. 

# Con los datos del Ejercicio 1 relativos a los goles de David Villa, 
# construya diagramas de barras y de caja y bigotes para los goles marcados y partidos jugados.
# Calcule la covarianza y el coeficiente de correlaci´on entre estos dos datos. 



par(mfrow=c(2,2))
hist(df$npartidos)
hist(df$ngoles)
boxplot(df$npartidos)
boxplot(df$ngoles)

par(mfrow=c(1,1))

# Haga un gr´afico de dispersi´on entre los goles y el n´umero 
# de partidos jugados, marcando con una l´ınea vertical y otra horizontal 
# las medias. Marque tambi´en la recta de regresi´on lineal entre los datos. 
# Guarde todos los gr´aficos en archivo.


lm(npartidos~ngoles, data=df)

par(mfrow=c(1,1))
plot(df$ngoles, df$npartidos, xlab="Número de Partidos",
     ylab="Número de Goles",
     main="Los números de David VIlla")+
  abline(v=mean(df$ngoles, col="blue", lwd=3.0 )) +
  abline(h=mean(df$npartidos, col="green", lwd=3.0))+
  abline(42.2082, 0.0109, col="red", lwd=1.0)


map(df[,-1], mean)
map(df[,-1], var)
map(df[,-1], sd)

### 1.6. Leer datos de un fichero

# Como no tengo la base de datos, emtomces la creo.


casas<- data.frame(precio=c(52, 54.74, 57.5, 57.5, 59.79), 
                   area=c(830, 710, 1000, 690, 900), hab=c(5, 5, 5, 6, 5), 
                   edad=c(6.2, 7.5, 4.2, 8.8, 1.9), 
                   cal.cent=factor(c("no", "no", "no", "no", "si")))
head(casas)

ls()
casas$precio
plot(casas$precio,casas$area)

### 1.7 Grafico siguiendo el modelo 1.5 para la DB casas del 1.6

casa <- lm(precio~area+edad+cal.cent, data=casas)
casa

plot(casas$precio, casas$area, xlab="Área (m²)", 
     ylab="Precio (€)", 
     main="Regresión de precio en función de área y precio", 
     xlim = c(0, 1200), ylim = c(0, 100))

abline(coef(casa)[1], coef(casa)[2], col="blue", lwd=2, lty=2)
abline(coef(casa)[1] + coef(casa)[2]*mean(casas$area), 
       coef(casa)[3] + coef(casa)[4]*mean(casas$area), 
       col="green", lwd=2, lty=2)
abline(coef(casa)[1] + coef(casa)[2]*min(casas$area), 
       coef(casa)[3] + coef(casa)[4]*min(casas$area),
       col="red", lwd=2, lty=2)
abline(coef(casa)[1] + coef(casa)[2]*max(casas$area), 
       coef(casa)[3] + coef(casa)[4]*max(casas$area), 
       col="purple", lwd=2, lty=2)

