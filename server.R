# server.R
require(mosaic)
require(rJava)
require(repmis)
##twitter=source_DropboxData(file = "eqTwitter", key = "qc0mmglrkqklfk5", sep = ",", header = TRUE, fileEncoding="latin1")
twitter=read.csv("data/eqTwitter")
twitter=(select(twitter, name, city, X.1))
library(ggplot2)
library(shiny)
shinyServer(function(input, output) {
  output$table <- renderDataTable({
    data <- twitter
    if (input$Trend != "All"){
      data <- data[data$name == as.character(input$Trend),]
    }
    if (input$Date != "All"){
      data <- data[data$X.1 == as.character(input$Date),]
    }
    if (input$City != "All"){
      data <- data[data$city == as.character(input$City),]
    }
    data
  })
  
})
