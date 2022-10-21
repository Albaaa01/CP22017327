
browseURL('https://github.com/Albaaa01/LPE22017327')
if(!require('pacman'))install.packages('pacman')
pacman::p_load(pacman,magrittr,productplots,psych,RColorBrewer,tidyverse)
#pacman= load and unload
#magrittr = bidireccional piping
#productplots= graphics and car var
#psych= statistics
#RcolorBrewer = painting and colour palette
browseURL('http://j.mp/37Wxvv7')

?happy # te da información sobre el dataset y ver que tenemos datos precargados en r
que_tipo<-happy #me dice que tipo de dataframe es
df<-happy%>% as_tibble()
levels(df$happy)#check happy levels
#Reverser levels se puede crear una nueva columna o cambiar sobre una
df%<>%mutate(happy=fct_rev(happy))#aqui uso la misma
#df%>%mutate(marta_reverse=fct_rev(happy))%>%view()#aqui para añadir una columna

df%>%ggplot()+geom_bar(aes(happy,fill=happy))+
                        theme(axis.title.x=element_blank(),legend.position='none')

df%>%ggplot(aes(df$sex,fill=happy))+geom_bar(position='fill')

df%>%count(happy)#cuenta valores nulos
df%<>%select(happy:health)%>%view()
df%<>%filter(!is.na(happy))#ejecuto y luego vuelvo a ejecutar el count y ya no hay nulos



