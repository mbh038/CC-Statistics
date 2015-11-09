# server.R

library("shiny")

# Static Non-Reactive Area

# Read Survey Questions & Suggested Answers
Q <- read.csv("survey.csv", 'header' = FALSE)
# column 1 : questions
# column 2+: several answers

# Store Survey Questions & User Answers
A <- rep("", nrow(Q))
names(A)  <- Q[,1]
A[nrow(Q)+1] <- ""
names(A)[nrow(Q)+1] <- "User Unique ID"
A[nrow(Q)+2] <- ""
names(A)[nrow(Q)+2] <- "Course Code"
A[nrow(Q)+3] <- ""
names(A)[nrow(Q)+3] <- "Course Title"


# Dynamic Reactive Area
shinyServer(
  function(input, output) {
    
    # reactiveValues holds the counter - i - and User Answers - A - 
    values <- reactiveValues(i = 0, A = A)
    
    # The observers re-run the code whenever the button is clicked
    # Use isolate to avoid getting stuck in an infinite loop
    observe({ 
      if(is.null(input$increment) || input$increment == 0){return()} 
      values$i <- isolate(values$i) + 1
    }) 
    
    observe({ 
      if(is.null(input$decrement) || input$decrement == 0){return()} 
      values$i <- isolate(values$i) - 1 
    }) 
    
    # User Info Area
    userInfo <- renderUI({
      list(
        textInput("userName", "Enter your random ID here", 'ABC123')
        ,
        textInput("courseCode", "Enter course code", 'Econ999')
        ,
        textInput("courseTitle", "Enter course name", 'Economics for the Gifted')
        ,
        br()
      )
    })
    
    # Next Question Button
    nextButton <- renderUI({
      actionButton("increment", "Next")
    })
    
    # Previous Question Button
    backButton <- renderUI({
      actionButton("decrement", "Back")
    })
    
    # End Survey Button
    submitButton <- renderUI({
      actionButton("submit", HTML("<span style='color:#FF0000;'>Submit!</span>"))
    })
    
    # Save Data Button
    saveButton <- renderUI({
      downloadButton("download", "Save")
    })
    
    # Abort Survey Button
    abortButton <- renderUI({
      HTML("<a class='btn' href='/'>Start Over</a>") #<h4>(Reset all data)</h4>
    })
    
    # Display Survey in mainPanel
    output$survey <- renderUI({
      # Start Survey
      if (values$i == 0) { 
        return(list(h4("Ready to start the survey?"),br(),userInfo(),br(),nextButton()))
      } else {
        # End Survey
        if (values$i > nrow(Q)) { #values$i == nrow(Q)+1 is vulnerable to rapid clicks
          # Save Survey
          if ( is.null(input$submit) || input$submit==0 ) {
            return(list(
              list(h4("Ready to submit your answers?"),br())
              ,
              list(backButton(),submitButton(),br(),br())
              ,
              tableOutput("summary")
            ))
          } 
          # Start Over
          return(list(br(),h4("Survey Completed, thanks!"),br(),abortButton()))
        } else { 
          # Main Survey
          return(list(
            h4(textOutput("Question"))
            ,
            radioButtons("survey", "Select an answer:", c(Answers()))
            ,
            list(backButton(),nextButton(),br())
          ))
        }
      } 
    })
    
    # Survey Question Printed
    output$Question <- renderText({
      paste0("Q", values$i,":  ", Q[values$i,1])
    })
    
    # Survey Question Displayed as counter is incremented/decremented
    Answers <- reactive({
      Q <- Q[values$i,2:ncol(Q)]
      as.matrix(Q[Q!=""])
    })
    
    # Save each answers after each click on "next"
    observe({ 
      if(is.null(input$survey)) {return()}
      if (values$i > 0 & values$i < nrow(Q)+1) {
        values$A[values$i] <- input$survey
        #write.table(values$A, 'file' = "answers.csv", 'sep' = ",", 'col.names' = FALSE)#debug
      }
    })
    
    # Save User Info
    observe({
      if (is.null(input$userName)){return()}
      values$A[nrow(Q)+1] <- input$userName
      values$A[nrow(Q)+2] <- input$courseCode
      values$A[nrow(Q)+3] <- input$courseTitle
    })
    
    # Save all answers after click on "submit"
    observe({
      if(is.null(input$submit) || input$submit == 0) {return()}
      format(Sys.time(), "%a %b %d %X %Y")
      filename <- paste0("answers-",input$courseCode, "-", input$userName, "-", as.numeric(Sys.time()), ".csv")
      write.table(values$A, 'file' = filename, 'sep' = ",", 'col.names' = FALSE)
    })
    
    output$summary <- renderTable({
      if (values$i < nrow(Q)+1) {return()}
      as.data.frame(values$A[(nrow(Q)+3):1])
    }, 'include.rownames' = TRUE
    , 'include.colnames' = FALSE
    , 'sanitize.text.function' = function(x){x}
    )
    
    # Download Answers
    output$download <- downloadHandler(
      filename = function() {
        paste0("answers-", Sys.Date(), ".csv")
      } , 
      content = function(file) {
        write.table(values$A, file, 'sep' = ",", 'col.names' = FALSE)
      }
    )
    
    # Debug: Print counter value
    output$debug <- renderUI({
      return(invisible())# comment out this line to debug
      return(wellPanel(list( hr(), h4("Control Area")
                             , br(), paste0("counter value = ", values$i, " "), br()
                             #, br(), paste0("nrow(Q) = ", nrow(Q)), br()
                             , br(), saveButton(), br() 
      )))
    })
    
  })