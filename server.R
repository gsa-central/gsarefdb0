shinyServer(function(input, output, session){
  
  options(shiny.maxRequestSize=100*1024^2)
  
  
  ####################################################
  ###################   Input data   #################
  ####################################################
  source("global.R")
  data <- reactive(
    alldata <- list("GTdata" = GTdata,
                    "RBdata" = RBdata,
                    "GeGdata" = GeGdata,
                    "ncGdata" = ncGdata)
  )
  

  ####################################################
  #############  Output of Data Preview  #############
  ####################################################
  output$DT1 <- DT::renderDataTable(
    
    DT::datatable(data()$GTdata,
                  rownames = FALSE,
                  caption = htmltools::tags$caption(
                    style = 'caption-side: top; text-align: center;',
                    htmltools::h4('General methods and tools')
                  ),
                  escape = FALSE,
                  extensions = c('AutoFill','Buttons'),
                  selection = list(target = 'row'),
                  options = list(autoFill = TRUE,
                                 searchHighlight = TRUE,
                                 paging = TRUE,
                                 # pageLength = 25,
                                 dom = 'Blftsip',
                                 buttons = list(list(extend = "collection",
                                                     buttons = list(list(extend='csv',
                                                                         filename = 'General methods and tools'),
                                                                    list(extend = 'excel',
                                                                         filename = 'General methods and tools')),
                                                     text = "Download")),
                                 # customize the length menu 
                                 lengthMenu = list(c(25, 50, -1), # declare values
                                                   c(25, 50, "All") # declare titles
                                 ) # end of lengthMenu customization
          )
  
  output$DT2 <- DT::renderDataTable(
    DT::datatable(data()$RBdata,
                  rownames = FALSE,
                  caption = htmltools::tags$caption(
                    style = 'caption-side: top; text-align: center;',
                    htmltools::h4('Reviews and benchmarks')
                  ),
                  escape = FALSE,
                  extensions = c('AutoFill','Buttons'),
                  selection = list(target = 'row'),
                  options = list(autoFill = TRUE,
                                 searchHighlight = TRUE,
                                 paging = TRUE,
                                 pageLength = 25,
                                 #searchable = TRUE,
                                 dom = 'Blftsip',
                                 buttons = list(list(extend = "collection",
                                                     buttons = list(list(extend='csv',
                                                                         filename = 'Reviews and benchmarks'),
                                                                    list(extend = 'excel',
                                                                         filename = 'Reviews and benchmarks')),
                                                     text = "Download")), 
                                 # customize the length menu
                                 lengthMenu = list(c(25, 50, -1), # declare values
                                                   c(25, 50, "All") # declare titles
                                 ) # end of lengthMenu customization
                  )
    )
  )
  
  
  output$DT3 <- DT::renderDataTable(
    DT::datatable(data()$GeGdata,
                  rownames = FALSE,
                  caption = htmltools::tags$caption(
                    style = 'caption-side: top; text-align: center;',
                    htmltools::h4('Genomic Gene Set Analysis tools')
                  ),
                  escape = FALSE,
                  extensions = c('AutoFill','Buttons'),
                  selection = list(target = 'row'),
                  options = list(autoFill = TRUE,
                                 searchHighlight = TRUE,
                                 paging = TRUE,
                                 pageLength = 25,
                                 #searchable = TRUE,
                                 dom = 'Blftsip',
                                 buttons = list(list(extend = "collection",
                                                     buttons = list(list(extend='csv',
                                                                         filename = 'Genomic Gene Set Analysis tools'),
                                                                    list(extend = 'excel',
                                                                         filename = 'Genomic Gene Set Analysis tools')),
                                                     text = "Download")), 
                                 # customize the length menu
                                 lengthMenu = list(c(25, 50, -1), # declare values
                                                   c(25, 50, "All") # declare titles
                                 ) # end of lengthMenu customization
    )
  ))
  
  output$DT4 <- DT::renderDataTable(
    DT::datatable(data()$ncGdata,
                  rownames = FALSE,
                  caption = htmltools::tags$caption(
                    style = 'caption-side: top; text-align: center;',
                    htmltools::h4('Gene Set Analysis tools of ncRNA')
                  ),
                  escape = FALSE,
                  extensions = c('AutoFill','Buttons'),
                  selection = list(target = 'row'),
                  options = list(autoFill = TRUE,
                                 searchHighlight = TRUE,
                                 paging = TRUE,
                                 pageLength = 25,
                                 #searchable = TRUE,
                                 dom = 'Blftsip',
                                 buttons = list(list(extend = "collection",
                                                     buttons = list(list(extend='csv',
                                                                         filename = 'Gene Set Analysis tools of ncRNA'),
                                                                    list(extend = 'excel',
                                                                         filename = 'Gene Set Analysis tools of ncRNA')),
                                                     text = "Download")), 
                                 # customize the length menu
                                 lengthMenu = list(c(25, 50, -1), # declare values
                                                   c(25, 50, "All") # declare titles
                                 ) 
                  )
    )
 )
  
  # plot
  output$plot <- renderPlot({
    
    figa
    # ggarrange(figm,fign,figo,nrow=3,ncol=1)
    
  })
  
})
