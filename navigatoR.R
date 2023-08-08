# Main Menu Function ----

# Define Main Menu
main_menu <- function() {
  option <- c("Import/ Export Data Functions", "Cancel")
  selection <- menu(option, title = "Select an Action:")

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
  sub_option <- c("Feather Files", "JSON Files", "Delimited Files (Vroom)", "Back")
  sub_selection <- menu(sub_option, title = "Select a File Type:")

  # Define Options in the Sub Menu
  selected_option <- switch(
    sub_selection,
    feather_menu(),
    json_lite_menu(),
    vroom_io_menu(),
    return(main_menu())
  )
}

# Feather Menu ----

# Define Feather Menu
feather_menu <- function() {
  feather_option <- c(
    "Feather Store: Access a feather store like dataframe but read only",
    "Feather Metadata: Retrieve metadata about a feather file",
    "Read Feather: Read Feather Files",
    "Write Feather: Write Feather Files",
    "Back")
  feather_selection <- menu(feather_option, title = "Please select an action with feather:")

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

  clipr::write_clip(feather_selected_option)
  message("Selected Option Has Been Copied")
  message(cli::rule())

  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n",  append = TRUE)
  message("File Updated")
}



# JSON Menu ----

# Define json_lite Menu
json_lite_menu <- function() {
  json_lite_option <- c(
    "Read JSON: Read JSON Files",
    "Write JSON: Write JSON Files",
    "Convert R to JSON: Convert an R Object into JSON",
    "Convert JSON to R: Convert a JSON Object into R",
    "Back")
  json_lite_selection <- menu(json_lite_option, title = "Please select an action with jsonlite:")

  # Define Options in the json_lite Menu
  json_lite_selected_option <- switch(
    json_lite_selection,
    "jsonlite::read_json(path = \"xxxxx.json\", simplifyVector = TRUE)",
    "jsonlite::write_json(path = \"xxxxx.json\")",
    "jsonlite::toJSON(pretty = TRUE)",
    "jsonlite::fromJSON() %>% as_tibble()",
    return(sub_menu())
  )

  # Define Comments for the Selected Option
  json_lite_selected_action <- switch(
    json_lite_selection,
    "# Read JSON File",
    "# Wrote JSON File",
    "# Converted R Object(s) to JSON",
    "# Coonverted JSON Object(s) to R"
  )

  clipr::write_clip(json_lite_selected_action)
  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n",  append = TRUE)
  message("Comment Placed")
  message(cli::rule())

  clipr::write_clip(json_lite_selected_option)
  message("Selected Option Has Been Copied")
  message(cli::rule())

  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n",  append = TRUE)
  message("File Updated")
}


# vroom Menu ----

# Define vroom Menu
vroom_io_menu<- function() {
  vroom_io_option <- c(
    "Read Delimited File: Read Delimited File into a Tibble",
    "Read Fixed Width File: Read a Fixed Width File into a Tibble",
    "Specify Column Positions: Guess Based on Position of Empty Cols",
    "Specify Column Positions: A Vector of Field Widths and A Vector of Field Names",
    "Specify Column Positions: Paired Vectors of Start and End Positions",
    "Specify Column Positions: Named Arguments with Start and End Positions",
    "Specify Column Positions: Named Arguments with Column Widths",
    "Write Rectangular Files: Write a Dataframe to a Delimited File",
    "Write Rectangular Files: Write Lines to a File",
    "Write Rectangular Files: Convert Data Frame to a Delimited String",
    "Back")

  vroom_io_selection <- menu(vroom_io_option, title = "Please select an action with jsonlite:")

  # Define Options in the json_lite Menu
  vroom_io_selected_option <- switch(
    vroom_io_selection,
    "vroom::vroom(file = \"xxxxx.csv_txt\")",
    "vroom::vroom_fwf(file = \"xxxxx.csv_txt\")",
    "vroom::vroom_fwf(file = \"xxxxx.csv_txt\", vroom::fwf_empty(file = \"xxxxx.csv_txt\", col_names = c(\"col_name1\", \"col_name2\", \"col_name3\")))",
    "vroom::vroom_fwf(file = \"xxxxx.csv_txt\", vroom::fwf_widths(c(20, 10, 12), c(\"col_name1\", \"col_name2\", \"col_name3\")))",
    "vroom::vroom_fwf(file = \"xxxxx.csv_txt\", vroom::fwf_positions(c(1, 30), c(20, 42), c(\"col_name1\", \"col_name2\", \"col_name3\")))",
    "vroom::vroom_fwf(file = \"xxxxx.csv_txt\", vroom::fwf_cols(col_name1 = c(1, 20), col_name2 = c(30, 42)))",
    "vroom::vroom_fwf(file = \"xxxxx.csv_txt\", vroom::fwf_cols(col_name1 = 20, col_name2 = 10, col_name3 = 12))",
    "vroom::vroom_write(df_name, file = \"xxxxx.csv_txt\", delim = \",\")",
    "vroom::vroom_write_lines(character_vector, file = \"xxxxx.csv_txt\", eol = \"\n\", na = \"NA\", append = FALSE)",
    "vroom::vroom_format(x, delim = \"\t\", eol = \"\n\", na = \"NA\", col_names = TRUE)",
    return(sub_menu())
  )

  # Define Comments for the Selected Option
  vroom_io_selected_action <- switch(
    vroom_io_selection,
    "Read Delimited File into a Tibble",
    "Read a Fixed Width File into a Tibble",
    "Specified Columns",
    "Specified Columns",
    "Specified Columns",
    "Specified Columns",
    "Specified Columns",
    "Wrote a Dataframe to a Delimited File",
    "Wrote Lines to a File",
    "Converted Data Frame to a Delimited String"
  )

  clipr::write_clip(vroom_io_selected_action)
  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n",  append = TRUE)
  message("Comment Placed")
  message(cli::rule())

  clipr::write_clip(vroom_io_selected_option)
  message("Selected Option Has Been Copied")
  message(cli::rule())

  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n",  append = TRUE)
  message("File Updated")
}



main_menu()




