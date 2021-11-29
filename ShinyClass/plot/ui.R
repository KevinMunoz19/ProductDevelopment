library(shiny)

shinyUI(fluidPage(

  titlePanel('Interacciones del usuario con graficas'),
  tabsetPanel(
    tabPanel('graficas shiny',
      h1('graficas shiny'),
      plotOutput('grafica_base_r'),
      plotOutput('grafica_ggplot')
    ),
    tabPanel(
      'Interacciones con plots',
      plotOutput('plot_click_option',
                 click = 'clk',
                 dblclick = 'dclk',
                 hover =  'mouse_hover',
                 brush = 'mouse_brush'),
      verbatimTextOutput('click_data'),
      tableOutput('mtcars_tbl')
    )
  )

))
