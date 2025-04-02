library(WDI)
library(tidyverse)

options(scipen = 999)

# Baixar os dados
TaxaNatalidadeBruta <- WDI('all', indicator = 'SP.DYN.CBRT.IN')
TaxaNatalidadeBruta2021 <- WDI('all', indicator = 'SP.DYN.CBRT.IN', start = 2021, end = 2021)
TaxaNatalidadeBrutaBR <- WDI('BR', indicator = 'SP.DYN.CBRT.IN')





# 🔵 Gráfico 1: Heatmap da Taxa de Natalidade Global ao longo do tempo
grafpainel <- ggplot(TaxaNatalidadeBruta, aes(x = year, y = reorder(country, SP.DYN.CBRT.IN), fill = SP.DYN.CBRT.IN)) +
  geom_tile() +  # Cria o heatmap
  scale_fill_gradient(low = "blue", high = "red", name = "Taxa Natalidade") +  # Cores do mais baixo (azul) ao mais alto (vermelho)
  theme_minimal() +
  labs(title = "Evolução da Taxa de Natalidade por País",
       x = "Ano", y = "País") +
  theme(axis.text.y = element_text(size = 6))  # Reduz tamanho do texto para caber mais países
grafpainel  


# 🟢 Gráfico 2: Comparação entre países em 2021
graficocorte <- ggplot(TaxaNatalidadeBruta2021, aes(x = reorder(country, SP.DYN.CBRT.IN), y = SP.DYN.CBRT.IN, fill = SP.DYN.CBRT.IN)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  scale_fill_gradient(low = "blue", high = "red") +  # Gradiente de cores
  coord_flip() +  
  theme_minimal() +
  labs(title = "Taxa de Natalidade Bruta por País (2021)", x = "País", y = "Taxa de Natalidade") +
  theme(axis.text.y = element_text(size = 8, face = "bold"))
graficocorte  

# 🔴 Gráfico 3: Evolução da Taxa no Brasil
graficoserie <- ggplot(TaxaNatalidadeBrutaBR, aes(x = year, y = SP.DYN.CBRT.IN)) +
  geom_line(color = "red", size = 1) +
  geom_point(size = 3, color = "black") +
  theme_classic() +
  labs(title = "Evolução da Taxa de Natalidade no Brasil", x = "Ano", y = "Taxa de Natalidade") +
  theme(plot.title = element_text(size = 14, face = "bold", color = "darkred"))
graficoserie  



