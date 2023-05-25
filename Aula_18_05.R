library(dplyr)
library(lubridate)
library(stringr)

dados <- read.csv("Pokemon_full.csv")

df_means <- dados %>%
  group_by(type, secundary.type) %>%
  summarise(
    media_h = mean(height),
    media_w = mean(weight)
  )

df_means
View(df_means)

#EXERCICIO 1

#? left_join:
df <- left_join(dados, df_means, by = "type")
View(df)
df %>% 
  filter(type == "bug") %>% head(15)
df %>% tail()

#? right_join:
df <- right_join(dados, df_means, by = "type")
View(df)
df %>% 
  filter(type == "bug") %>% head(15)
df %>% tail()


#EXERCICIO 2

library(tidyr)
library(readr)

dados <- readr::read_rds("imdb.rds")
View(dados)
head(dados)
names(dados)

df <- dados %>% 
  select(orcamento, receita, receita_eua, nota_imdb, num_avaliacoes, num_criticas_publico, num_criticas_critica)
df


matriz_correlacao <- cor(df, use="complete.obs")
View(matriz_correlacao)


valores_correlacao <- matriz_correlacao[upper.tri(matriz_correlacao)]
ranking_correlacao <- sort(valores_correlacao, decreasing = TRUE)
matriz_correlacao_decrescente <- matrix(ranking_correlacao, ncol = 1)
View(matriz_correlacao_decrescente)