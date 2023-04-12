ui <- fluidPage(
  titlePanel("Censoring App"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("censoring",
                  "Extent of censoring (to the right):",
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