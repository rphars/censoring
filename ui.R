ui <- fluidPage(
  titlePanel("Censoring App"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("censoring",
                  "Extent of censoring (from above):",
                  min = 0,
                  max = 100,
                  value = 0,
                  step = 1
      )
    ),
    mainPanel(
      plotOutput("regressionPlot"),
      verbatimTextOutput("betas")
    )
  )
)
