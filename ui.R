# Inspired by: http://www.econometricsbysimulation.com/2013/11/Shiny-Survey-Tool.html

# ui.R

library("shiny")

# Define UI for slider demo application
shinyUI(
  pageWithSidebar( 
    headerPanel("Econ Program Survey")
    ,
    sidebarPanel(
      # customize display settings    
      tags$head(
        tags$style(type='text/css'
                   , ".span12 h1 {font-size: 21px; line-height:21px;}" # font size in title
                   , ".span12 h1 {color: rgb(0,0,150);}" # color in title
                   , ".row-fluid .span4 {width: 25%;}" # width of sidebarPanel
                   , ".row-fluid .span4 .well {font-size: 10pt;}"
                   , ".shiny-bound-input {font-size: 120%;}" # font size in input panel
                   , ".shiny-bound-output {font-size: 100%;}" # font size in output panel
                   , ".btn {padding: 8px; font-size: 120%;}" # button appearance
                   , ".data td, .data th, .data tr {font-family: monospace; text-align: left;}"
                   , "table.data td[align=right] {font-family: monospace; text-align: left;}" # row.names appearance
                   , ".data tr:nth-child(even){background-color: rgb(245,245,245);}"  # even-numbered rows background
                   , ".table {border-spacing: 0px;}" # horizontal line and background color superimposed
                   , ".table.data {color: rgb(0,0,150);}" # background color in data table
                   , ".table-bordered td, .table-bordered th {border-top: 1px solid rgb(245,245,245);}" # horizontal lines
                   , ".table-bordered {border-width: 0px;}" # suppress border around whole table
                   , ".table-bordered td, .table-bordered th {border-left: none;}" # suppress vertical lines
        )
      )
      ,
      helpText("Shiny App written by Patrick Toche @ Copyright 2013.")
      ,
      helpText("Version 0.01")
      ,
      tags$hr()
      ,
      helpText("This app is presently hosted on the shiny beta server. Thanks to the RStudio team for making this app and the server available free of charge. ")
      ,
      helpText(a("http://spark.rstudio.com/toche/demo-survey", href="http://spark.rstudio.com/toche/demo-survey", target="_blank"))
    )
    ,
    mainPanel(
      uiOutput("survey")
      ,
      uiOutput("debug")
    )
  )
)