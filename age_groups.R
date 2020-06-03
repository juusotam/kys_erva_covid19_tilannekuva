ageGroups <- function(data, date = NULL) {
  tbl <- data
  p <- tbl %>% 
    filter(pvm == date) %>% 
    select(pvm, site.id, 
           covid19.0_9,
           covid19.10_19,
           covid19.20_29,
           covid19.30_39,
           covid19.40_49,
           covid19.50_59,
           covid19.60_69,
           covid19.70_79,
           covid19.80) %>% 
    mutate_at(vars(covid19.0_9,
                   covid19.10_19,
                   covid19.20_29,
                   covid19.30_39,
                   covid19.40_49,
                   covid19.50_59,
                   covid19.60_69,
                   covid19.70_79,
                   covid19.80), as.numeric) %>% 
    filter(!is.na(covid19.0_9)) %>% 
    gather(key = "key", value = "measurement", covid19.0_9, covid19.10_19,
           covid19.20_29,
           covid19.30_39,
           covid19.40_49,
           covid19.50_59,
           covid19.60_69,
           covid19.70_79,
           covid19.80) %>% 
    mutate(key = case_when(key == "covid19.0_9" ~ "0-9 vuotta",
                           key == "covid19.10_19" ~ "10-19 vuotta",
                           key == "covid19.20_29" ~ "20-29 vuotta",
                           key == "covid19.30_39" ~ "30-39 vuotta",
                           key == "covid19.40_49" ~ "40-49 vuotta",
                           key == "covid19.50_59" ~ "50-59 vuotta",
                           key == "covid19.60_69" ~ "60-69 vuotta",
                           key == "covid19.70_79" ~ "70-79 vuotta",
                           key == "covid19.80" ~ "80+ vuotta")) %>% 
    ggplot(aes(x = key, y = measurement, fill = site.id)) + geom_bar(stat = "identity", position = "stack") +
    scale_fill_viridis_d(name = "Sairaala") +
    labs(title = "Uusia COVID-19 potilaita sairaalahoitoon ikäryhmittäin",
         subtitle = "SecAppiin ilmoitetut luvut",
         y = "Potilaita",
         x = "Ikäryhmä") + 
    theme(line = element_blank(),
          rect = element_blank(),
          strip.text.x = element_text(size = 12, colour = "black", face = "bold"),
          strip.background = element_rect(colour = "black", fill = "white"),
          plot.caption = element_text(color = "black", face = "italic"),
          axis.text.x = element_text(angle = 60, hjust = 1))
  return(p)
}

ageGroupsCum <- function(data, date = NULL) {
  tbl <- data
  p <- tbl %>% 
    select(pvm, site.id, 
           covid19.0_9,
           covid19.10_19,
           covid19.20_29,
           covid19.30_39,
           covid19.40_49,
           covid19.50_59,
           covid19.60_69,
           covid19.70_79,
           covid19.80) %>% 
    mutate_at(vars(covid19.0_9,
                   covid19.10_19,
                   covid19.20_29,
                   covid19.30_39,
                   covid19.40_49,
                   covid19.50_59,
                   covid19.60_69,
                   covid19.70_79,
                   covid19.80), as.numeric) %>% 
    filter(!is.na(covid19.0_9)) %>% 
    gather(key = "key", value = "measurement", covid19.0_9, covid19.10_19,
           covid19.20_29,
           covid19.30_39,
           covid19.40_49,
           covid19.50_59,
           covid19.60_69,
           covid19.70_79,
           covid19.80) %>% 
    mutate(key = case_when(key == "covid19.0_9" ~ "0-9 vuotta",
                           key == "covid19.10_19" ~ "10-19 vuotta",
                           key == "covid19.20_29" ~ "20-29 vuotta",
                           key == "covid19.30_39" ~ "30-39 vuotta",
                           key == "covid19.40_49" ~ "40-49 vuotta",
                           key == "covid19.50_59" ~ "50-59 vuotta",
                           key == "covid19.60_69" ~ "60-69 vuotta",
                           key == "covid19.70_79" ~ "70-79 vuotta",
                           key == "covid19.80" ~ "80+ vuotta")) %>% 
    ggplot(aes(x = key, y = measurement, fill = site.id)) + geom_bar(stat = "identity", position = "stack") +
    scale_fill_viridis_d(name = "Sairaala") +
    labs(title = "Sairaalahoitoa vaatineet COVID-19 potilaat ikäryhmittäin",
         subtitle = "Kumulatiivinen. SecAppiin ilmoitetut luvut",
         y = "Potilaita",
         x = "Ikäryhmä") + 
    theme(line = element_blank(),
          rect = element_blank(),
          strip.text.x = element_text(size = 12, colour = "black", face = "bold"),
          strip.background = element_rect(colour = "black", fill = "white"),
          plot.caption = element_text(color = "black", face = "italic"),
          axis.text.x = element_text(angle = 60, hjust = 1))
  return(p)
}

