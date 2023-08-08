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

# Feather Menu ----

# Define Feather Menu
feather_menu <- function() {
  feather_options <- c(
    "Feather Store: Access a feather store like dataframe but read only",
    "Feather Metadata: Retrieve metadata about a feather file",
    "Read Feather: Read Feather Files",
    "Write Feather: Write Feather Files",
    "Back")
  feather_selection <- menu(feather_options, title = "Please select an action with Feather:")

  # Define Options in the Feather Menu
  feather_selected_option <- switch(
    feather_selection,
    "feather::feather(path = \"xxxxx\")",
    "feather::feather_metadata(path = \"xxxxx\")",
    "feather::read_feather(path = \"xxxxx\")",
    "feather::write_feather(path = \"xxxxx\")",
    return(sub_menu())
  )

  # Define Comments for the Selected Option
  feather_selected_action <- switch(
    feather_selection,
    "# Accessed Feather Store",
    "# Accessed Metadata",
    "# Read Feather File(s)",
    "# Wrote Feather File(s)"
  )

  clipr::write_clip(feather_selected_action)
  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n",  append = TRUE)
  message("Comment Placed")
  message(cli::rule())

  clipr::write_clip(selected_option)
  message("Selected Option Has Been Copied")
  message(cli::rule())

  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n",  append = TRUE)
  message("File Updated")
}

main_menu()




