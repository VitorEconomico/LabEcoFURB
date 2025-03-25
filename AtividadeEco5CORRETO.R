

library(WDI)

options(scipen = 999) #Ajustar numeros

TaxaNatalidadeBruta <- WDI('all',
               indicator = 'SP.DYN.CBRT.IN') #Vários locais, vários períodos

TaxaNatalidadeBruta2021 <- WDI('all',
                               indicator = 'SP.DYN.CBRT.IN',
                               start = 2021, end = 2021) #Vários locais, um período

TaxaNatalidadeBrutaBR <- WDI('BR',
                             indicator = 'SP.DYN.CBRT.IN') #Um local, vários períodos

#para pegar dados abra o site WDI e > series > clica izinho
