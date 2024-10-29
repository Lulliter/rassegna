# Function to create a new Quarto post  -----
create_quarto_post <- function(categories, template_file = here::here("_R","template.qmd")) {

	# Get the current date and format it as yyyy-mm-dd
	current_date <- format(Sys.Date(), "%Y-%m-%d")
	title <- paste(current_date, "rassegnina", sep = "-")
	title_post <- paste0("Micro-rassegna del ", current_date)

	# Generate a valid slug for the post directory based on the title
	slug <- gsub(" ", "-", tolower(title))
	post_dir <- file.path("posts", slug)

	# Check if the post directory already exists
	if (dir.exists(post_dir)) {
		index_qmd_path <- file.path(post_dir, "index.qmd")

	# Check if index.qmd already exists
		if (file.exists(index_qmd_path)) {
			stop("A file 'index.qmd' already exists in the folder: ", post_dir,
				  ". Stopping to prevent overwriting.")
		}
	} else {
		dir.create(post_dir, recursive = TRUE)
	}

	# Format the categories as a YAML list
	formatted_categories <- paste0("[", paste(shQuote(categories), collapse = ", "), "]")

	# Create the index.qmd file from the template
	index_qmd_path <- file.path(post_dir, "index.qmd")
	if (file.exists(template_file)) {
		# Read the content from the template
		content <- readLines(template_file)
		# Write the new index.qmd with dynamically inserted YAML
		writeLines(c(
			"---",
			paste("title:", shQuote(title_post)),
			paste("categories:", formatted_categories),
			paste("date:", current_date),  # Directly insert the current date
			"toc: TRUE",
			"draft: FALSE",
			'image: ""',
			'image-alt: ""',
			"---",
			"",
			content  # Add the template content after YAML
		), index_qmd_path)
	} else {
		# Create a basic file if template.qmd doesn't exist
		writeLines(c(
			"---",
			paste("title:", shQuote(title)),
			paste("categories:", shQuote(categories)),
			"date: `r Sys.Date()`",
			"toc: true",
			"draft: false",
			'image: ""',
			'image-alt: ""',
			"---",
			"",
			"# Introduction",
			"",
			"Write your content here..."
		), index_qmd_path)
	}

	# Open the index.qmd file in RStudio (if using RStudio)
	if (interactive()) {
		rstudioapi::navigateToFile(index_qmd_path)
	}

	message("Quarto post created at: ", post_dir)
}

# Example usage ----
create_quarto_post(categories = c("rassegna", "ENG 🇺🇸", "ITA 🇮🇹"))
create_quarto_post(categories = c("lexicon",  "ITA 🇮🇹"))
#
