library(caret)
library(randomForest)
library(plyr)
library(e1071)

set.seed(19801982)
data_directory <- "data_car/"

fn_list <- list.files(path=data_directory, pattern = "data$")
car_data <- read.csv(file = paste(data_directory, fn_list[1], sep=""))
names(car_data) <- c("buying", "maint", "doors", "persons", "lug_boot", "safety", "class")
car_data$class <- revalue(car_data$class, c("unacc" = "unacceptable",
                                            "acc" = "acceptable", "vgood" = "very good"))
car_data$buying <- revalue(car_data$buying, c("vhigh" = "very high", "med" = "medium"))
car_data$maint <- revalue(car_data$maint, c("vhigh" = "very high", "med" = "medium"))
car_data$doors <- revalue(car_data$doors, c("5more" = "5 or more"))
car_data$lug_boot <- revalue(car_data$lug_boot, c("big" = "large", "med" = "medium"))
car_data$safety <- revalue(car_data$safety, c("med" = "medium"))
modelFitA <- train(class ~ ., method = "rf", data=car_data)


overallScore <- function(buying, maint, doors, persons, lug_boot, safety){
    temp <- data.frame("buying" = buying, "maint" = maint, "doors" = doors, 
                       "persons" = persons, "lug_boot" = lug_boot, "safety" = safety)
    as.character(predict(modelFitA, temp))
}

library(shiny)
shinyServer(
    function(input, output) {
        output$obuying <- renderPrint({input$buying})
        output$omaint <- renderPrint({input$maint})
        output$odoors <- renderPrint({input$doors})
        output$opersons <- renderPrint({input$persons})
        output$olug_boot <- renderPrint({input$lug_boot})
        output$osafety <- renderPrint({input$safety})
        output$opredict <- renderPrint({overallScore(input$buying, input$maint, input$doors, 
                                                     input$persons, input$lug_boot, input$safety)})
    }
)