library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("For Whom Should I Cheer?"),
  sidebarPanel(
    selectInput("league", "Which League?", 
                choices = c("National",
                           "American")),
    sliderInput('wins',"Minimun Number of Wins",min=1,max=100,value=50),
    radioButtons("playoffs", "Headed for the Playoffs?",
                 choices = c('Yes','Does not Matter'), selected = NULL, inline = FALSE)
    ),
  mainPanel(
    imageOutput('image')
  )
))