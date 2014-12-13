# server.R
require(mosaic)
#twitter=read.csv("data/eqTwitter")
twitter=read.csv("~/Documents/academic/fall 14/data science/dataframe/data/eqTwitter",header=TRUE,fileEncoding="latin1")
#twitter=read.csv("~/Documents/academic/fall 14/data science/dataframe/data/eqTwitter",header=TRUE,fileEncoding="UCS-2LE")
twitter=(select(twitter, name, city, X.1))
#names(twitter) <- c("Trend", "City", "Date")
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
