#ui
library(ggplot2)
library(shiny)
shinyUI(fluidPage(
  titlePanel("Voice of Twitter"),
  
  fluidRow(
    column(3,
      selectInput("Trend",
                  "Trending Topics:",
                  c("All", 
                    unique(as.character(twitter$name))))
    ),
    
    column(3, 
           selectInput("Date",
                       "Date:",
                       c("All", 
                         unique(as.character(twitter$X.1))))
     ),
    column(3, 
         selectInput("City",
                     "Cities:",
                    c("All", 
                      unique(as.character(twitter$city))))
     ),
    
    fluidRow(
      dataTableOutput(outputId="table"))
     )
   )
 )


