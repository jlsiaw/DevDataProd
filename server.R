library(shiny)
library(ggplot2)

data(mtcars)
df <- mtcars
df$am <- factor(df$am, labels= c("Automatic", "Manual"))
ton2lbs <- 2000
fit <- lm(mpg ~ am + hp +wt, data= df)
coef <- fit$coefficients

shinyServer(
     function(input, output) {
         mpgPred <- reactive({
             coef[1] + 
             coef[2]*input$amVal + 
             coef[3]*as.numeric(input$hpVal) + 
             coef[4]*as.numeric(input$wtVal)*ton2lbs/1000
         })
         
         output$mpgVal <- renderText({paste0("Predicted MPG : ", 
                                            round(mpgPred(), 2) )})
         
         output$hpPlot <- renderPlot({
             p <- ggplot(df, aes(x= hp, y= mpg, colour= am)) + 
                 geom_point() + stat_smooth(method= lm) +
                 theme(legend.position=c(1,1), legend.justification=c(1,1))+
                 xlab("Horsepower (bhp)") + ylab("Miles per Gallon")+
                 geom_vline(xintercept= as.numeric(input$hpVal))+
                 geom_hline(yintercept= mpgPred())
                 
             suppressWarnings(print(p))
         })
         
         output$wtPlot <- renderPlot({
             q <- ggplot(df, aes(x= wt/2, y= mpg, colour= am)) + 
                 geom_point() + stat_smooth(method= lm) +
                 theme(legend.position=c(1,1), legend.justification=c(1,1)) +
                 xlab("Weight (ton)") + ylab("Miles per Gallon")+
                 geom_vline(xintercept= as.numeric(input$wtVal))+
                 geom_hline(yintercept= mpgPred())
             
             suppressWarnings(print(q))
         })
         
#         output$tableOut <- renderTable({ df })
         output$tableOut = renderDataTable({ df }, 
                            options = list(lengthMenu = c(5,10,15),
                                           pageLength = 5,
                                           orderClasses = TRUE))
     }
)
