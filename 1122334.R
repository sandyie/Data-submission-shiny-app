library(shiny)
library(digest)
library(dplyr)
library(shinyjs)

# fields need to be saved
fields <- c("farmName", "uploadInfo", "hardiDanger", "emergency", "num_input") #"dataFile")

# location of data saved
outputDir <- file.path("/Users/sandyyiee/dashboard-sandy/inputData")

# get current Epoch time
epochTime <- function() {
  return(as.integer(Sys.time()))
}

# get a formatted string of the timestamp -- todo!! 
humanTime <- function() {
  # TODO! 
}

# save the results in a table with approprate coloumn
saveData <- function(data) {
  fileName <- sprintf("%s_%s.csv",
                      humanTime(),
                      digest::digest(data))
  
  write.csv(x = data, file = file.path(outputDir, fileName),
            row.names = FALSE, quote = TRUE)
}
# load all data in the folders and export them in a table display
loadData <- function() {
  files <- list.files(file.path(outputDir), full.names = TRUE)
  data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  data <- dplyr::bind_rows(data)
  data
}


# set up the layout panel for the ui, server for the web app
shinyApp(
  ui = fluidPage(
    titlePanel("Grape information upload"),
    textInput("farmName", "Farm Name"),
    textInput("uploadInfo", "Current day grape information"),
    checkboxInput("hardiDanger", "Is the hardiness in danger zone? ", FALSE),
    checkboxInput("emergency", "Does this information contains any unnormal record?", FALSE),
    sliderInput("num_input", "Number of entry in the data", 0, 20, 1, ticks = FALSE),
    fileInput("dataFile", "Data file"),
    actionButton("submit", "Submit", class = "btn-primary"),
    # display output
    DT::dataTableOutput("responsesTable"),
  ),
  
  server = function(input, output, session) {
    
    # form a table using given data
    formData <- reactive({
      data <- sapply(fields, function(x) input[[x]])
      data <- c(data, timestamp = epochTime())
      data <- t(data)
      data
    })
    
    # save the form data when user submit (click submission button)
    observeEvent(input$submit, {
      saveData(formData())
    })
    
    output$responsesTable <- DT::renderDataTable(
      loadData(),
      rownames = FALSE,
      options = list(searching = TRUE, lengthChange = FALSE)
    )
    
  })
