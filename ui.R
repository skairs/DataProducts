library(shiny)



shinyUI(fluidPage(theme = "bootstrap.min.css",
    headerPanel("Car Evaluation Tool"),
    sidebarPanel(
        h3('Select Car Attributes'),
        selectInput("buying", label = "Purchase Price:", choices = c("very high", "high", "medium", "low")),
        selectInput("maint", label = "Maintenance Cost:", choices = c("very high", "high", "medium", "low")),
        selectInput("doors", label = "Number of doors:", choices = c("2", "4", "5 or more")),
        selectInput("persons", label = "Number of Passengers:", choices = c("2", "4", "more")),
        selectInput("lug_boot", label = "Cargo Capacity:", choices = c("small", "medium", "large")),
        selectInput("safety", label = "Overall Safety Rating:", choices = c("low", "medium", "high")),
        p("Note: Please be patient, as the tool takes a few moments to load.")
        ),
    mainPanel(
        h3('About this tool'),
        p("Using the Car Evaluation Data Set from UCI's Machine Learning Repository, we built a prediction model to assess a car's overall rating based on the following parameters: purchase price, maintenance costs, number of doors, number of passengers, cargo capacity, and overall safety.  Use the inputs in the left panel to select the attributes of the car you are considering, and our tool will predict its overall score.  The possible outcomes are unacceptable, acceptable, good and very good.  Happy car search!"),
        h3('Your Car:'),
        p('Purchase Price:'),
        verbatimTextOutput("obuying"),
        p('Maintenance Cost:'),
        verbatimTextOutput("omaint"),
        p('Number of doors:'),
        verbatimTextOutput("odoors"),
        p('Number of passengers:'),
        verbatimTextOutput("opersons"),
        p('Cargo Capacity:'),
        verbatimTextOutput("olug_boot"),
        p('Overall Safety Rating:'),
        verbatimTextOutput("osafety"),
        h3('Overall Score:'),
        verbatimTextOutput("opredict"),
        h3('References:'),
        p("Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.")
        )
    
    ))