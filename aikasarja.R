library(tidyverse)
library(viridis)

dat <- tbl %>% 
  mutate(site.id = factor(site.id),
         covid19.potilaat.yhteensa = as.numeric(covid19.potilaat.yhteensa),
         covid19.tehohoito.ja.tehovalvonta = as.numeric(covid19.tehohoito.ja.tehovalvonta))

dat %>% 
    ggplot(aes(x = pvm, y = covid19.potilaat.yhteensa, fill = site.id)) + 
    geom_bar(stat = "identity", position = "stack") +
    scale_fill_viridis_d(name = "Sairaala") +
    labs(title = "COVID-19 potilaita sairaalassa",
         subtitle = "SecAppiin ilmoitetut luvut",
         y = "Potilaita",
         x = "Päivämäärä",
         caption = "KSSHP 1.4. tiedot puuttuvat") + 
    theme(line = element_blank(),
          rect = element_blank(),
          strip.text.x = element_text(size = 12, colour = "black", face = "bold"),
          strip.background = element_rect(colour = "black", fill = "white"),
          plot.caption = element_text(color = "black", face = "italic"))
  
dat %>% 
  ggplot(aes(x = pvm, y = covid19.tehohoito.ja.tehovalvonta, fill = site.id)) + 
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_viridis_d(name = "Sairaala") +
  labs(title = "COVID-19 potilaita tehohoidossa",
       subtitle = "SecAppiin ilmoitetut luvut",
       y = "Potilaita",
       x = "Päivämäärä",
       caption = "KSSHP 1.4. tiedot puuttuvat") + 
  theme(line = element_blank(),
        rect = element_blank(),
        strip.text.x = element_text(size = 12, colour = "black", face = "bold"),
        strip.background = element_rect(colour = "black", fill = "white"),
        plot.caption = element_text(color = "black", face = "italic"))
  
