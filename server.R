library(shiny)
library(ggplot2)

server <- function(input, output) {
  set.seed(123)
  n <- 100
  x <- rnorm(n)
  y <- 2 * x + rnorm(n)
  
  y_censored <- reactive({
    censoring <- input$censoring
    pmin(y, censoring)
  })
  
  output$regressionPlot <- renderPlot({
    data <- data.frame(x = x, y_censored = y_censored())
    model <- lm(y_censored() ~ x, data = data)
    
    ggplot(data, aes(x = x, y = y_censored())) +
      geom_point() +
      geom_abline(aes(intercept = coef(model)[1], slope = coef(model)[2])) +
      labs(title = "Regression with Censoring",
           x = "X",
           y = "Y (censored)") +
      theme_minimal() +
      coord_cartesian(ylim = range(y))
  })
  
  output$betas <- renderText({
    data <- data.frame(x = x, y_censored = y_censored())
    model <- lm(y_censored() ~ x, data = data)
    
    paste("True population beta:", 2,
          "\nEstimated beta (censored data):", round(coef(model)[2], 4))
  })
}
