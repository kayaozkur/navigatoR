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

# Sub Menu Function ----

# Define Sub Menu
sub_menu <- function() {
  sub_options <- c("Feather Files", "Back")
  sub_selection <- menu(sub_options, title = "Select a File Type:")
  
  # Define Options in the Sub Menu
  selected_option <- switch(
    sub_selection,
    feather_menu(),
    return(main_menu())  
  )
}



