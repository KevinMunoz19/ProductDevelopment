library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  output$grafica_base_r <- renderPlot({
    plot(mtcars$wt,mtcars$mpg, xlab = 'wt', ylab = 'Millas por galon')
  })
  
  output$grafica_ggplot <- renderPlot({
    diamonds %>%
      ggplot(aes(x=carat,y=price,color=color))+
      geom_point()+
      xlab('Precio')+
      ylab('Kilates')+
      ggtitle('Precio de diamantes por kilate')
  })
  
  
  output$plot_click_option <- renderPlot({
    plot(mtcars$wt,mtcars$mpg, xlab = 'wt', ylab = 'Millas por galon')
  })
  
  output$click_data <- renderPrint({
    list(
      click_xy = c(input$clk$x,input$clk$y),
      double_clickl_xy = c(input$dclk$x,input$dclk$y),
      hover_xy = c(input$mouse_hover$x,input$mouse_hover$y),
      brush_xy = c(input$mouse_brush$xmin,input$mouse_brush$ymin,
                        input$mouse_brush$xmax,input$mouse_brush$ymax)
    )
  })
  
  output$mtcars_tbl <- renderTable({
    df <- nearPoints(mtcars, input$clk, xvar = 'wt',yvar = 'mpg')
    df <- brushedPoints(mtcars, input$mouse_brush,xvar='wt',yvar='mpg')
  })
  

  
  
})
