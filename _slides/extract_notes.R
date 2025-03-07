library(stringr)

# Read the Quarto file
qmd_file <- "_slides/slides.qmd"  # Change this to your actual file
qmd_content <- readLines(qmd_file, warn = FALSE)

# Find the starting and ending positions of notes blocks
start_positions <- grep("^::: \\{.notes\\}", qmd_content)
end_positions <- grep("^:::$", qmd_content)

# Extract the text inside each notes block
extract_notes <- function(start, end, content) {
	if (length(end) == 0 || all(end < start)) {
		end <- length(content)  # Assume notes go until the end if no matching `:::`
	} else {
		end <- min(end[end > start])  # Find the closest ending `:::`
	}
	content[(start + 1):(end - 1)]  # Extract the lines between markers
}

# Apply extraction
notes_list <- mapply(extract_notes, start_positions, MoreArgs = list(end = end_positions, content = qmd_content), SIMPLIFY = FALSE)

# Flatten the list and remove empty lines
notes <- unlist(notes_list)
notes <- notes[notes != ""]

# Print and save extracted notes
print(notes)
writeLines(notes, "_slides/slides_notes.txt")
