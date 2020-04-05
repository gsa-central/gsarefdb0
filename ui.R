shinyUI(fluidPage(
  theme = "try.css",
  navbarPage(
    title=div(img(src="GSACENTRAL_Logo.png", width = "100px", height = "50px"),
              style = "padding-left:50px;"),
    # h4("GSA-ref-DB"),
    # inverse = TRUE,
    tags$hr(),
    ##-- Title Header ----
    tags$div(
      class = "text-center",
      span(strong(h2("GSARefDB - The Gene Set Analysis Reference Database")),
           style = "color:steelblue")),
    tags$hr(),
    tabPanel(strong(h4("General Methods and Tools")),
             # Download Button
             # downloadButton('downloadData', 'Download'),
             DT::dataTableOutput("DT1")),
    tabPanel(h4("Reviews and Benchmarks"),
             DT::dataTableOutput("DT2")),
    tabPanel(h4("Genomic GSA"),
            DT::dataTableOutput("DT3")),
    tabPanel(h4("ncRNA GSA"),
             DT::dataTableOutput("DT4")),
    tabPanel(h4("Analysis"),
             shiny::plotOutput("plot",width = "100%", height = "1000px")),
    tabPanel(h4("Submit"),
             includeMarkdown("www/files/Submit.md")),
    tabPanel(h4("Archive"), 
             includeMarkdown("www/files/Archive.md")),
    tabPanel(h4("FAQs"), 
             includeMarkdown("www/files/FAQs.md")),
    selected = strong(h4("General Methods and Tools")),
    tags$hr(),
    footer = tags$div(
      class = "text-center",
      span(strong(h3("Last updated: March 16th, 2020")),
           style = "color:gray")))
))
