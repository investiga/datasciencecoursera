pollutantmean <- function(directory, pollutant, id = 1:332) {
  means <- c()
  for (m in id) {
    path <- paste(getwd(),
                  "/",
                  directory,
                  "/",
                  sprintf("%03d", m),
                  ".csv",
                  sep = "")
    m_data <- read.csv(path)
    i_data <- m_data[pollutant]
    means <- c(means, i_data[!is.na(i_data)])
  }
  mean(means)
}