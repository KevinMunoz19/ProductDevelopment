library(shiny)
library(DT)

shinyUI(fluidPage(
  
  titlePanel("Tablas en DT"),
  tabsetPanel(
    tabPanel('Tablas DT',
             h1('Vista Basica'),
             DT::dataTableOutput('tabla1'),
             h2('Filtros'),
             DT::dataTableOutput('tabla2')
             ),
    tabPanel('Click en tablas',
             fluidRow(
               column(6,
                      h2('Single select row'),
                      DT::dataTableOutput('tabla3'),
                      verbatimTextOutput('output1')
                      ),
               column(6,
                      h2('Multiple select row'),
                      DT::dataTableOutput('tabla4'),
                      verbatimTextOutput('output2')
                      )
             ),
             fluidRow(
               column(6,
                      h2('Single select col'),
                      DT::dataTableOutput('tabla5'),
                      verbatimTextOutput('output3')
               ),
               column(6,
                      h2('Multiple select col'),
                      DT::dataTableOutput('tabla6'),
                      verbatimTextOutput('output4')
               )
             ),
             fluidRow(
               column(6,
                      h2('Single select cell'),
                      DT::dataTableOutput('tabla7'),
                      verbatimTextOutput('output5')
               ),
               column(6,
                      h2('Multiple select cell'),
                      DT::dataTableOutput('tabla8'),
                      verbatimTextOutput('output6')
               )
             ),
             fluidRow(
               column(6,
                      h2('Single select row col'),
                      DT::dataTableOutput('tabla9'),
                      verbatimTextOutput('output7')
               ),
               column(6,
                      h2('Multiple select row col'),
                      DT::dataTableOutput('tabla10'),
                      verbatimTextOutput('output8')
               )
             )
             
             
             
             ),
  )
))
