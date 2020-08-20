complete <- function(directory, id = 1:332) {
  results <- data.frame(id = numeric(0), nobs = numeric(0))
  for (m in id) {
    path <-
      paste(getwd(),
            "/",
            directory,
            "/",
            sprintf("%03d", m),
            ".csv",
            sep = "")
    m_data <- read.csv(path)
    i_data <- m_data[(!is.na(m_data$sulfate)),]
    i_data <-i_data[(!is.na(i_data$nitrate)),]
    nobs <- nrow(i_data)
    results <- rbind(results, data.frame(id = m, nobs = nobs))
  }
  results
}