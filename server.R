library(shiny)
library(ISLR)
attach(Auto)
Auto <- Auto[-9]

shinyServer(
        function(input, output){
                output$oid1 <- renderPrint({input$id1})
                topn <- function(x, y){
                        p <-ncol(x)
                        colnames(x) <- c("cylinders", "displacement", 
                                   "horsepower", "weight", 
                                   "acceleration", "year",
                                   "origin")
                        pvalues <- numeric(p)
                        for(i in seq_len(p)){
                                fit <- lm(y ~ x[, i])
                                summ <- summary(fit)
                                pvalues[i] <- summ$coefficients[2, 4]
                        }
                        ord <- order(pvalues)
                        N <- input$id1
                        ord <- ord[1:N]
                        xn <- x[, ord]
                        fit <- lm(y ~ xn)
                        return(coef(fit))
                }
                output$oid2 <- renderPrint({
                        input$goButton
                        x <- cbind(Auto$cylinders, Auto$displacement, 
                                   Auto$horsepower, Auto$weight, 
                                   Auto$acceleration, Auto$year,
                                   Auto$origin)
                        topn(x, Auto$mpg)})
        }
)