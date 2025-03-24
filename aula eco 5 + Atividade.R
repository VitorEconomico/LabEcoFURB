# API
#série temporal= tem uma pessoa, um país, um produto, em um determinado período de tempo.
library(WDI)

options(scipen = 999) #Ajustar numeros
basepib <- WDI('all',
               indicator = 'NY.GDP.MKTP.CD')
              

basepib <- WDI('all',
               indicator = 'NY.GDP.MKTP.CD')


basepib2023 <- WDI ('all',
               indicator = 'NY.GDP.MKTP.CD',
               start = 2023, end = 2023) # Corte transversal




DadosPibBR <- WDI('BR',
               indicator = 'NY.GDP.MKTP.CD')


