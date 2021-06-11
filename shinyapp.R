library(shiny)

# fields need to be saved
saveData <- c("farmName", "uploadInfo", "hardiDanger", "tempAccurate", "emergency", "num_input")

# get current Epoch time
epochTime <- function() {
  return(as.integer(Sys.time()))
}




# set up the layout panel for the ui
shinyApp(
  ui = fluidPage(
    titlePanel("Grape information upload"),
    div(
      id = "form",
      
      textInput("farmName", "Farm Name", ""),
      textInput("uploadInfo", "Current day grape information"),
      checkboxInput("hardiDanger", "Is the hardiness in danger zone? ", FALSE),
      checkboxInput("tempAccurate", "Is the temperture displayed accurate? ", FALSE),
      checkboxInput("emergency", "Does this information contains any unnormal record?", FALSE),
      sliderInput("num_input", "Number of entry in the data", 0, 20, 1, ticks = FALSE),
#      selectInput("os_type", "Operating system used most frequently",
#                  c("",  "Windows", "Mac", "Linux")),
      actionButton("submit", "Submit", class = "btn-primary")
    )
  ),
  server = function(input, output, session) {
  }
)

# set up mandatory field of upload
shinyjs::useShinyjs()
shinyjs::useShinyjs()
