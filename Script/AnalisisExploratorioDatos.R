
library(funModeling)
library(dplyr)
library(Hmisc)
data(heart_disease)


#funcion df_status para analisis de NA , O Y Infinitos 

df_status(heart_disease)

# Analizar los datos ingresados

my_data_status = df_status(heart_disease, print_results = F)

# Quitar las variables que tienen un 60% de valores cero

vars_to_remove = filter(my_data_status, p_zeros > 60)%>%
  .$variable

vars_to_remove

# Conservar todas las columnas excepto aquellas presentes en el vector 'vars_to_remove'

heart_disease_2 = select(heart_disease, -one_of(vars_to_remove))

#Ordenar datos según el porcentaje de ceros

arrange(my_data_status, -p_zeros)%>%select(variable, q_zeros, p_zeros)

#----------------------------------------------------------------------------
# Cantidad total de filas
nrow(heart_disease)


# Cantidad total de columnas

ncol(heart_disease)

# Nombres de columnas

colnames(heart_disease)

#---------------------------------------------------------------------------
#Análisis de variables categóricas dos variables

freq(data=heart_disease, input = c('thal','chest_pain'))

#Análisis de variables categóricas para todos 

freq(data = heart_disease)

#Análisis de variables categóricas para una variables y sin graficos 

freq(data = heart_disease$age, plot = FALSE, na.rm = TRUE)

#----------------------------------------------------------------------------
#funcion describe
# Conservar solamente las dos variables que utilizaremos en este ejemplo
heart_disease_3 = select(heart_disease, thal, chest_pain)

describe(heart_disease_3)
