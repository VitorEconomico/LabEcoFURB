library(WDI)
library(tidyverse)
library(viridis)

options(scipen = 999)

# Top 10 países mais populosos
top10_paises <- c("CN", "IN", "US", "ID", "PK", "BR", "NG", "BD", "RU", "MX")

# Dados
TaxaNatalidadeBruta <- WDI(country = top10_paises, indicator = 'SP.DYN.CBRT.IN')
TaxaNatalidadeBruta2021 <- WDI(country = top10_paises, indicator = 'SP.DYN.CBRT.IN', start = 2021, end = 2021)
TaxaNatalidadeBrutaBR <- WDI(country = "BR", indicator = 'SP.DYN.CBRT.IN')

# Paleta moderna
paleta_mod <- scale_fill_viridis(name = "Taxa de Natalidade", option = "D", direction = -1)

# 🔵 Gráfico 1: Heatmap com viridis (sem borda, Brasil em amarelo)
grafpainel <- ggplot(TaxaNatalidadeBruta, aes(x = year, y = reorder(country, SP.DYN.CBRT.IN), fill = SP.DYN.CBRT.IN)) +
  geom_tile() +
  paleta_mod +
  theme_minimal(base_size = 12) +
  labs(
    title = "🌍 Evolução da Taxa de Natalidade - 10 Países Mais Populosos",
    subtitle = "Cores modernas (viridis), nome do Brasil destacado",
    x = "Ano", y = "País"
  ) +
  theme(
    axis.text.y = element_text(
      size = 10,
      face = ifelse(unique(reorder(TaxaNatalidadeBruta$country, TaxaNatalidadeBruta$SP.DYN.CBRT.IN)) == "Brazil", "bold", "plain"),
      color = ifelse(unique(reorder(TaxaNatalidadeBruta$country, TaxaNatalidadeBruta$SP.DYN.CBRT.IN)) == "Brazil", "gold", "black")
    ),
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 11)
  )
grafpainel


# 🟢 Gráfico 2: Barras 2021 com nome do Brasil amarelo
graficocorte <- ggplot(TaxaNatalidadeBruta2021,
                       aes(x = reorder(country, SP.DYN.CBRT.IN),
                           y = SP.DYN.CBRT.IN,
                           fill = SP.DYN.CBRT.IN)) +
  geom_bar(stat = "identity") +
  paleta_mod +
  coord_flip() +
  theme_minimal(base_size = 12) +
  labs(
    title = "📊 Taxa de Natalidade Bruta (2021) - Top 10 Populosos",
    subtitle = "Cores modernas (viridis), nome do Brasil em amarelo",
    x = "País", y = "Taxa de Natalidade"
  ) +
  theme(
    axis.text.y = element_text(
      size = 10,
      face = ifelse(levels(reorder(TaxaNatalidadeBruta2021$country, TaxaNatalidadeBruta2021$SP.DYN.CBRT.IN)) == "Brazil", "bold", "plain"),
      color = ifelse(levels(reorder(TaxaNatalidadeBruta2021$country, TaxaNatalidadeBruta2021$SP.DYN.CBRT.IN)) == "Brazil", "gold", "black")
    ),
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 11)
  )
graficocorte


# 🔴 Gráfico 3: Linha do Brasil (sem alterações, já estilizado)
graficoserie <- ggplot(TaxaNatalidadeBrutaBR, aes(x = year, y = SP.DYN.CBRT.IN)) +
  geom_line(color = "darkgreen", size = 1.2, linetype = "dashed") +
  geom_point(size = 3.5, color = "gold", shape = 21, fill = "gold", stroke = 1) +
  theme_classic(base_size = 12) +
  labs(
    title = "📉 Evolução da Taxa de Natalidade no Brasil (1960–2023)",
    subtitle = "Linha tracejada verde e pontos amarelos para o Brasil",
    x = "Ano", y = "Taxa de Natalidade"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", color = "darkgreen"),
    plot.subtitle = element_text(size = 11, color = "#666")
  )
graficoserie
