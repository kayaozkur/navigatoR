# Main Menu Function ----

# Define Main Menu
main_menu <- function() {
  option <- c("Import/ Export Data Functions", "Cancel")
  selection <- menu(option, title = "Select an Action:")

  # Define Options in the Main Menu
  selected_option <- switch(selection,
    sub_menu(),
    return(print("No Action Performed"))
  )
}

# Sub Menu Function ----

# Define Sub Menu
sub_menu <- function() {
  sub_option <- c(
    "Feather Files",
    "JSON Files",
    "Delimited Files (Vroom)",
    "Arrow or Parquet Files (Arrow)",
    "Back"
  )
  sub_selection <- menu(sub_option, title = "Select a File Type:")

  # Define Options in the Sub Menu
  selected_option <- switch(sub_selection,
    feather_menu(),
    json_lite_menu(),
    vroom_io_menu(),
    arrow_menu(),
    return(main_menu())
  )
}

# Feather Menu ----

# Define Feather Menu
feather_menu <- function() {
  feather_option <- c(
    "Feather Store: Access a Feather Store like Dataframe but Read Only",
    "Feather Metadata: Retrieve Metadata about a Feather File",
    "Read Feather: Read Feather File",
    "Write Feather: Write Feather File",
    "Back"
  )
  feather_selection <- menu(feather_option, title = "Please select an action with feather:")

  # Define Options in the Feather Menu
  feather_selected_option <- switch(feather_selection,
    "feather::feather(path = \"xxxxx.feather\")",
    "feather::feather_metadata(path = \"xxxxx.feather\")",
    "feather::read_feather(path = \"xxxxx.feather\")",
    "feather::write_feather(path = \"xxxxx.feather\")",
    return(sub_menu())
  )

  # Define Comments for the Selected Option
  feather_selected_action <- switch(feather_selection,
    "# Accessed Feather Store",
    "# Accessed Metadata",
    "# Read Feather File",
    "# Wrote Feather File"
  )

  clipr::write_clip(feather_selected_action)
  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n", append = TRUE)
  message("Comment Placed")
  message(cli::rule())

  clipr::write_clip(feather_selected_option)
  message("Selected Option Has Been Copied")
  message(cli::rule())

  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n", append = TRUE)
  message("File Updated")
}



# JSON Menu ----

# Define json_lite Menu
json_lite_menu <- function() {
  json_lite_option <- c(
    "Read JSON: Read JSON File",
    "Write JSON: Write JSON File",
    "Convert R to JSON: Convert an R Object into JSON",
    "Convert JSON to R: Convert a JSON Object into R",
    "Back"
  )
  json_lite_selection <- menu(json_lite_option, title = "Please select an action with jsonlite:")

  # Define Options in the json_lite Menu
  json_lite_selected_option <- switch(json_lite_selection,
    "jsonlite::read_json(path = \"xxxxx.json\", simplifyVector = TRUE)",
    "jsonlite::write_json(path = \"xxxxx.json\")",
    "jsonlite::toJSON(pretty = TRUE)",
    "jsonlite::fromJSON() %>% as_tibble()",
    return(sub_menu())
  )

  # Define Comments for the Selected Option
  json_lite_selected_action <- switch(json_lite_selection,
    "# Read JSON File",
    "# Wrote JSON File",
    "# Converted R Object to JSON",
    "# Coonverted JSON Object to R"
  )

  clipr::write_clip(json_lite_selected_action)
  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n", append = TRUE)
  message("Comment Placed")
  message(cli::rule())

  clipr::write_clip(json_lite_selected_option)
  message("Selected Option Has Been Copied")
  message(cli::rule())

  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n", append = TRUE)
  message("File Updated")
}


# vroom Menu ----

# Define vroom IO Menu
vroom_io_menu <- function() {
  vroom_io_option <- c(
    "Read Delimited File: Read Delimited File into a Tibble",
    "Read Fixed Width File: Read a Fixed Width File into a Tibble",
    "Specify Column Positions: Guess Based on Position of Empty Cols",
    "Specify Column Positions: A Vector of Field Widths and A Vector of Field Names",
    "Specify Column Positions: Paired Vectors of Start and End Positions",
    "Specify Column Positions: Named Arguments with Start and End Positions",
    "Specify Column Positions: Named Arguments with Column Widths",
    "Write Rectangular File: Write a Dataframe to a Delimited File",
    "Write Rectangular File: Write Lines to a File",
    "Write Rectangular File: Convert Data Frame to a Delimited String",
    "Back"
  )

  vroom_io_selection <- menu(vroom_io_option, title = "Please select an action with jsonlite:")

  # Define Options in the vroom IO Menu
  vroom_io_selected_option <- switch(vroom_io_selection,
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
  vroom_io_selected_action <- switch(vroom_io_selection,
    "Read Delimited File into a Tibble",
    "Read a Fixed Width File into a Tibble",
    "Specified Columns Guessing Based on Col Positions",
    "Specified Columns Col Length and Col Names",
    "Specified Columns Start End Position and Col Names",
    "Specified Columns Start End Position and Col Names",
    "Specified Columns Col Length and Col Names",
    "Wrote a Dataframe to a Delimited File",
    "Wrote Lines to a File",
    "Converted Data Frame to a Delimited String"
  )

  clipr::write_clip(vroom_io_selected_action)
  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n", append = TRUE)
  message("Comment Placed")
  message(cli::rule())

  clipr::write_clip(vroom_io_selected_option)
  message("Selected Option Has Been Copied")
  message(cli::rule())

  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n", append = TRUE)
  message("File Updated")
}


# arrow Menu ----

# Define arrow Menu
arrow_menu <- function() {
  arrow_option <- c(
    "Read Arrow File: Read a Feather File",
    "Read Arrow File: Read an Arrow IPC (aka Feather) File",
    "Read Arrow File: Read an Arrow IPC Stream Format",
    "Read Arrow File: Read a Parquet File",
    "Read Arrow File: Read a CSV File with Arrow",
    "Read Arrow File: Read a TSV File with Arrow",
    "Read Arrow File: Read a JSON File",
    "Write Arrow File: Write a Feather File",
    "Write Arrow File: Write an Arrow IPC (aka Feather) File",
    "Write Arrow File: Write an Arrow Data to Raw Vector",
    "Write Arrow File: Write a Parquet File",
    "Write Arrow File: Write a CSV File with Arrow",
    "Back"
  )

  arrow_selection <- menu(arrow_option, title = "Please select an action with jsonlite:")

  # Define Options in the json_lite Menu
  arrow_selected_option <- switch(arrow_selection,
    "arrow::read_feather(file = \"xxxxx.feather\", col_select = NULL, as_data_frame = TRUE, mmap = TRUE) #mmap is for memory maping the file",
    "arrow::read_ipc_file(file = \"xxxxx.arrow\", col_select = NULL, as_data_frame = TRUE, mmap = TRUE) #mmap is for memory maping the file",
    "arrow::read_ipc_stream(file = \"xxxxx\", col_select = NULL, as_data_frame = TRUE, mmap = TRUE) #mmap is for memory maping the file",
    "arrow::read_parquet(file = \"xxxxx\", col_select = NULL, as_data_frame = TRUE, props = ParquetArrowReaderProperties$create())",
    "arrow::read_csv_arrow(file = \"xxxxx.csv\", escape_double = TRUE, escape_backslash = FALSE, schema = NULL, col_names = TRUE, col_types = NULL, col_select = NULL, na = c(\"\", \"NA\"), quoted_na = TRUE, skip_empty_rows = TRUE, skip = 0L)",
    "arrow::read_tsv_arrow(file = \"xxxxx.tsv\", escape_double = TRUE, escape_backslash = FALSE, schema = NULL, col_names = TRUE, col_types = NULL, col_select = NULL, na = c(\"\", \"NA\"), quoted_na = TRUE, skip_empty_rows = TRUE, skip = 0L)",
    "arrow::read_json_arrow(file = \"xxxxx.json\", col_select = NULL, as_data_frame = TRUE, schema = NULL)",
    "arrow::write_feather(x = data_frame, sink = \"xxxxx.feather\", version = c(1,2))", #version 1 for legacy .feather files, version 2 for .arrow files
    "arrow::write_ipc(x = data_frame, sink = \"xxxxx.arrow\")",
    "arrow::write_to_raw(x = data_frame, format = c(\"stream\", \"file\"))",
    "arrow::write_parquet(x = data_frame, sink = \"xxxxx.parquet\", compression = arrow::default_parquet_compression())",
    "arrow::write_csv_arrow(x = data_frame, sink = \"xxxxx.csv\", include_header = TRUE, na = \"\")",
    return(sub_menu())
  )

  # Define Comments for the Selected Option
  arrow_selected_action <- switch(arrow_selection,
    "Read a Feather File",
    "Read an Arrow IPC (aka Feather) File",
    "Read an Arrow IPC Stream Format",
    "Read a Parquet File",
    "Read a CSV File with Arrow",
    "Read a TSV File with Arrow",
    "Read a JSON File with Arrow",
    "Wrote a Feather File",
    "Wrote an Arrow IPC (aka Feather) File",
    "Wrote Arrow Data to Raw Vector",
    "Wrote a Parquet File",
    "Wrote a CSV File with Arrow"
  )

  clipr::write_clip(arrow_selected_action)
  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n", append = TRUE)
  message("Comment Placed")
  message(cli::rule())

  clipr::write_clip(arrow_selected_option)
  message("Selected Option Has Been Copied")
  message(cli::rule())

  clipr::read_clip() %>%
    write(file = "clips.txt", sep = "\n", append = TRUE)
  message("File Updated")
}


main_menu()



