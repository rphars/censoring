ui <- fluidPage(
  titlePanel("Censoring App"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("censoring",
                  "Censoring threshold (from above):",
                  min = min(y),
                  max = max(y),
                  value = max(y),
                  step = 0.1
      )
    ),
    mainPanel(
      plotOutput("regressionPlot"),
      verbatimTextOutput("betas")
    )
  )
)
