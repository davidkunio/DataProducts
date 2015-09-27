library(shiny)

wd.datapath = paste0(getwd(),"/data")
wd.init = getwd()
setwd(wd.datapath)

teamlistinitial <- read.csv('standings.csv',stringsAsFactors=FALSE)

setwd(wd.init)

shinyServer(function(input, output) {
  data <- reactive({ 
    LG <- switch(input$league,
                  "National" = 'NL',
                  "American" = 'AL')
    PLAY <- switch(input$playoffs,
                 "Yes" = 10,
                 "No" = 32)
    teamlist <- teamlistinitial
    teamlist <- subset(teamlist,teamlist$Lg==LG)
    teamlist <- subset(teamlist,teamlist$W > input$wins)
    teamlist <- subset(teamlist,Rk < PLAY)
    team <- teamlist$Tm[sample(1:length(teamlist$Tm),1)]
  })
  output$image <- renderImage({
    if (is.null(input$league))
      return(NULL)
    src_link <- paste('images/',team,'.jpg',sep='')
    alt_txt <- team
    return(list(
        src = src_link,
        contentType = "image/jpg",
        alt = alt_txt
      ))
    }, deleteFile = FALSE)
  
})