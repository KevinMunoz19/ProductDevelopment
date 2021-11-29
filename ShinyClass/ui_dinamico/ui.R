
library(shiny)
library(dplyr)


shinyUI(fluidPage(

  titlePanel("UI Dinamico"),
  tabsetPanel(tabPanel("Ejemplo 1",
                       numericInput('min1','limite inferior',value=5),
                       numericInput('max1','limite superior',value=10),
                       sliderInput('slider1','Seleccione valor',min=0,
                                   max=15,value=5)
                       ),
              tabPanel("Ejemplo 2",
                       sliderInput('s1','Seleccione valor',min=-5,max=5,value=0),
                       sliderInput('s2','Seleccione valor',min=-5,max=5,value=0),
                       sliderInput('s3','Seleccione valor',min=-5,max=5,value=0),
                       sliderInput('s4','Seleccione valor',min=-5,max=5,value=0),
                       actionButton('reset','Reiniciar')
                       ),
              tabPanel("Ejemplo 3",
                       numericInput('n','corridas',value=10),
                       actionButton('correr','correr')
                       ),
              tabPanel("Ejemplo 4",
                       numericInput('nvalue','valor', value=0)
                       ),
              tabPanel("Ejemplo 5",
                       numericInput('celsius','temperatura en celsius',value=NA),
                       numericInput('farenheit','temperatura en farenheit',value=NA)
                       ),
              tabPanel('Ejemplo 6',
                       br(),
                       selectInput('dist','Seleccione distribucion',
                                   choices = c('Normal','Uniforme','Exponencial')
                                   ),
                       numericInput('n_random', 'Numero aleatorio', value=100, min=0),
                       hr(),
                       tabsetPanel(id='params', 
                                   type='hidden',
                                   tabPanel('Normal',
                                            h1('Distribucion Normal'),
                                            numericInput('media','media',value=0),
                                            numericInput('sd','sd',value=1)
                                            ),
                                   tabPanel('Uniforme',
                                            h1('Distribucion Uniforme'),
                                            numericInput('unif_min','minimo',value=0),
                                            numericInput('unif_max','maximo',value=1)
                                   ),
                                   tabPanel('Exponencial',
                                            h1('Distribucion Exponencial'),
                                            numericInput('razon','razon',value=1,min=0)
                                   ),
                                   
                                   ),
                       plotOutput('plot_dist')
                       )
              
              )
))
