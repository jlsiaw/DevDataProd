library(shiny)

#shinyUI(pageWithSidebar(
shinyUI(fluidPage(
    
    includeCSS("styles.css"),
    
    headerPanel("Predict the Mile per Gallon (MPG) of your Car"),
    br(),
    
    sidebarPanel( 
         textInput(inputId="hpVal", label= "Horsepower (50-350) bhp"),
         textInput(inputId="wtVal", label= "Car Weight (0.5-3.0) ton"),
         checkboxInput(inputId="amVal", label= "Manual Transmission", FALSE),
         br(),
         strong('SPECIAL NOTES:'),
         p('Study in the previous regression project found out that MPG has strong 
           correlation with variables am (auto, manual), wt (weight) and 
           hp (horsepower) which fit into a multivariate linear regression model.'),
         a(href= 'https://github.com/jlsiaw/datasciencecoursera/blob/master/RegModel.pdf',
           'Reference to previous report'),
         p(''),
         p('This exercise will base on the selected model to predict the MPG value
           from all three identified variables. The predicted MPG will be refreshed 
           whenever a new value is entered.'),
         p('Reference lines for the predicted MPG value is also drawn to charts
           to help in understanding from multiple angles.')
         ),
    br(),
      
    mainPanel( 
         textOutput('mpgVal'),
         br(),
         
         splitLayout(plotOutput('hpPlot'), plotOutput('wtPlot')),
         br(),
         
#         tableOutput('tableOut')
         tabsetPanel(
             tabPanel('mtcars', dataTableOutput("tableOut"))
         )
         
    )
))
