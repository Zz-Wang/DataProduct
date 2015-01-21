shinyUI(pageWithSidebar(
                headerPanel("Top N Features that predict mpg in Auto Dataset"),
        sidebarPanel(
                numericInput("id1", "How many features do you want?", 1, min = 1, max = 7, step = 1),
                submitButton("Go!")
                ),
        mainPanel(
                h3("Outputs"),
                h4("Top N features you chose"),
                verbatimTextOutput("oid1"), 
                h4("Top N features in the regression p-values"),
                verbatimTextOutput("oid2")
        )
))