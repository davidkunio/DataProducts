library(shiny)

shinyUI(fluidPage(
  headerPanel("For Whom Should I Cheer?"),
  sidebarPanel(
    selectInput("league", "Which League?", 
                choices = c("National",
                           "American")),
    sliderInput('wins',"Minimun Number of Wins",min=1,max=100,value=50),
    radioButtons("playoffs", "Headed for the Playoffs?",
                 choices = c('Yes','No'), selected = NULL, inline = FALSE)
    ),
  mainPanel(
    imageOutput('team_image')
  )
))