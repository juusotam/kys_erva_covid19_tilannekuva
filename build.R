# Komento raportin rakentamista varten

rmarkdown::render("raportti.Rmd", output_file = paste0("KYS ERVA COVID-19 raportti - ", Sys.Date(),".docx"), output_dir = "output")
