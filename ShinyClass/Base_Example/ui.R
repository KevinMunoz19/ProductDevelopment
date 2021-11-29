library(shiny)


shinyUI(fluidPage(

    titlePanel("Cargando Archivos"),
    sidebarLayout(
      sidebarPanel(
        fileInput('cargar_archivo','Cargar Archivo',
                  buttonLabel = 'Buscar',
                  placeholder = 'No hay archivo'
        ),
        dateRangeInput('rango_fechas', 'Seleccione fechas',
                  min = '1900-01-05',
                  max = '2007-09-30',
                  start = '1900-01-05',
                  end = '2007-09-30',
                  ),
        downloadButton("download_dataframe",'Descargar Archivo')
      ),
      mainPanel(
        DT::dataTableOutput('contenido_archivo')
      )
    )

))
