
library(Hmisc)

# Cargar datos desde el repositorio de libros sin alterar el formato

data_world = read.csv(file = "https://goo.gl/2TrDgN", 
             header = T, stringsAsFactors = F, na.strings = "")

names(data_world)
# Excluir los valores faltantes en Series.Code. Los datos 
#descargados de la página web contienen c

data_world = filter(data_world, Series.Code !="")

# La función mágica que conserva los valores más recientes de cada métrica. Si no están familiarizados con R, entonces salten esta parte.
max_ix<-function(d) 
{
  ix=which(!is.na(d))
  res=ifelse(length(ix)==0, NA, d[max(ix)])
  return(res)
}

data_world$newest_value=apply(data_world[,5:ncol(data_world)], 1, FUN=max_ix)

# Visualizar las primeras tres filas
head(data_world, 3)


name = unique(select(data_world, Series.Name, Series.Code))

head(name,5)