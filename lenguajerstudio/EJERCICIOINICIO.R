

# ID  ---------------------------------------------------------------------

##Lenguajes de programación estadistica
##Profesor: Christian Sucuzhanay Arevalo
##Alumno: Alba Mª Laguna Moraleda, EXP:21017327
## HANDS ON 01



# LOADING LIBS ------------------------------------------------------------

#install.packages("tidyverse","httr","janitor")
# INGEST ------------------------------------------------------------------

# SHORTCUTS ---------------------------------------------------------------

##control + l : clean
##control + windows + r : seccion

# GIT COMMANDS ------------------------------------------------------------

git status
git init
git add
git commit -m "message"
git push -u origin main
git branch -M nombre
git merge
git remote add origin https://github.com/sukuzhanay/LPE21535220.git
git clone https://github.com/sukuzhanay/LPE21535220.git
git pull 
git fetch
# TERMINAL COMMANDS -------------------------------------------------------

ls(lista)
cd
pwd
cd ..(ir para atras)
mkdir(directorio)
touch(crear archivo)
nano(invocas notepad)
less(abrir archivo desde terminal , deja subir y bajar)
cat (abrir archivo desde terminal, no deja subir y bajar)
clear
where
which



# LOADING LIBS ------------------------------------------------------------
### httr: enlaces fuera
### janitor: formatear/limpiar datos
install.packages("tidyverse")
install.packages("packman")
install.packages("httr") 
install.packages('janitor')
install.packages('jsonlite')
install.packages(c("tidyverse","httr","janitor","jsonlite"))

library(tidyverse)


# BASIC OPERATORS ---------------------------------------------------------

cristina <- 20
clase_lep <- c("marta","emilia","pablo")
clase <- list("marta","emilia","pablo",52)
url_<-"https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
gln<-httr::GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
xml2::read_xml(gln$content)
glimpse(gln)
# READING && WRITTING -----------------------------------------------------
f_raw<-jsonlite::fromJSON(url_)

gln_source<-f_raw$ListaEESSPrecio %>% glimpse()

df2<-gln_source %>% janitor::clean_names() %>% type_convert(locale=locale(decimal_mark=","))

#CREATING A NEW VARIABLES--------------------------------------------------
#Clasificamos por gasolineras baratas y no baratas 
df2%>%mutate(expensive=rotulo %in%c("CEPSA","REPSOL","BP","SHELL"))%>%view()
ds22017327_33c<-df2%>%mutate(expensive=!rotulo %in%c("CEPSA","REPSOL","BP","SHELL")) #no caras

#Calcular precio medio de la gasolina en las CCAA---------------------------
ds22017327_34c<-df_low%>%select(precio_gasoleo_a,idccaa,rotulo,expensive)%>%drop_na()%>%group_by(idccaa,expensive)%>%summarise(mean(precio_gasoleo_a))%>%data.frame("Comunidades"= c("Andalucia","Aragón","Principado de Asturias","Islas Baleares","Canarias","Cantabria","CastillaLeon","CastillaLaMancha","Cataluña","ComunidadValenciana","Extremadura","Galicia","Madrid","Murcia","Navarra","Paisvasco","Rioja","Ceuta","Melilla"))%>%view()

write.csv(ds22017327_33c,file = "C:/Users/Usuario/lenguajerstudio/ds22017327_33c.csv")
write.csv(ds22017327_34c,file = "C:/Users/Usuario/lenguajerstudio/22017327_34c.csv")
