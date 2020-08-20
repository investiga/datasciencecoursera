corr <- function(directory, limite = 0) {
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  cor_results <- numeric(0)
  
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs >= limite,]
  #print(complete_cases["id"])
  #print(unlist(complete_cases["id"]))
  #print(complete_cases$id)
  
  if (nrow(complete_cases) > 0) {
    for (m in complete_cases$id) {
      path <-
        paste(getwd(),
              "/",
              directory,
              "/",
              sprintf("%03d", m),
              ".csv",
              sep = "")
      #print(path)
      m_data <- read.csv(path)
      #print(monitor_data)
      i_data <-
        m_data[(!is.na(m_data$sulfate)),]
      i_data <-
        i_data[(!is.na(i_data$nitrate)),]
      sulfate_data <- i_data["sulfate"]
      nitrate_data <- i_data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results
}