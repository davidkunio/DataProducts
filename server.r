library(shiny)

wd.datapath = paste0(getwd(),"/data")
wd.init = getwd()
setwd(wd.datapath)
#teamlistinitial <- read.csv('standings.csv')
teamlistinitial <- read.csv('standings.csv',stringsAsFactors=FALSE)
setwd(wd.init)

shinyServer(function(input, output) {
  team <- reactive({ 
    LG <- switch(input$league,
                  "National" = 'NL',
                  "American" = 'AL')
    PLAY <- switch(input$playoffs,
                 "Yes" = 10,
                 "No" = 32)
    teamlist <- teamlistinitial
    teamlist <- teamlist[teamlist$Lg==LG,]
    teamlist <- teamlist[teamlist$W > input$wins,]
    teamlist <- teamlist[teamlist$Rk < PLAY,]
    teamname <- teamlist$Tm[sample(1:length(teamlist$Tm),1)]
    return(teamname)
  })
  output$team_image <- renderImage({
    src_link <- paste('images/',team(),'.jpg',sep='')
    alt_txt <- team()
    return(list(
        src = src_link,
        contentType = "image/jpg",
        alt = alt_txt
      ))
    }, deleteFile = FALSE)
  
})