# Komento raportin rakentamista varten

rmarkdown::render("aikasarja.Rmd", output_file = paste0("KYS ERVA COVID-19 raportti - ", Sys.Date(),".pdf"), 
                  output_dir = "output", 
                  knit_root_dir = getwd(), 
                  intermediates_dir = getwd(),
                  clean = FALSE)
