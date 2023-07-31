# Main Menu Function ----

# Define Main Menu
main_menu <- function() {
  options <- c("Import/ Export Data Functions", "Cancel")
  selection <- menu(options, title = "Select an Action:")
  
  # Define Options in the Main Menu
  selected_option <- switch(
    selection,
    sub_menu(),
    return(print("No Action Performed"))  
  )
}




