# load packages ----
library(shiny)
library(reactlog)

# ui ----
ui <- fluidPage(
  
  # radio button input ----
  radioButtons(
    inputId = "img", label = "Choose a penguin to display:",
    choices = c("All penguins", "Sassy chinstrap", "Staring gentoo", "Adorable adelie"),
    selected = "All penguins"),
  
  # img output ----
  imageOutput(outputId = "penguin_img"),
  
  # text output ----
  textOutput(outputId = "penguin_text")
  
)


# server ----
server <- function(input, output){
  
  # render penguin images ----
  output$penguin_img <- renderImage({
    
    if(input$img == "All penguins"){
      list(src = "www/all_penguins.jpeg", height = 240, width = 300)
    }
    else if(input$img == "Sassy chinstrap"){
      list(src = "www/chinstrap.jpeg", height = 240, width = 300)
    }
    else if(input$img == "Staring gentoo"){
      list(src = "www/gentoo.jpeg", height = 240, width = 300)
    }
    else if(input$img == "Adorable adelie"){
      list(src = "www/adelie.gif", height = 240, width = 300)
    }
    
  }, deleteFile = FALSE)
  
  # render penguin text ----
  output$penguin_text <- renderText({
    
    if(input$img == "All penguins"){
      "Meet all of our lovely penguins species!"
    }
    else if(input$img == "Sassy chinstrap"){
      "Chinstraps get their name from the thin black line that runs under their chins"
    }
    else if(input$img == "Staring gentoo"){
      "Gentoos stand out because of their bright orange bills and feet"
    }
    else if(input$img == "Adorable adelie"){
      "Adelie penguins are my personal favorite <3"
    }
  })
}

# combine UI & server into an app ----
shinyApp(ui = ui, server = server)