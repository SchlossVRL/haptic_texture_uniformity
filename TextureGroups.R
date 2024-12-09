#clear environment 
rm(list=ls())

#libraries
library(tidyverse)
library(skimr)

# Original texture names (112 textures)
textures <- c(
  "D1", "D10", "D100", "D101", "D102", "D103", "D104", "D105", "D106", "D107",
  "D108", "D109", "D11", "D110", "D111", "D112", "D12", "D13", "D14", "D15",
  "D16", "D17", "D18", "D19", "D2", "D20", "D21", "D22", "D23", "D24", "D25",
  "D26", "D27", "D28", "D29", "D3", "D30", "D31", "D32", "D33", "D34", "D35",
  "D36", "D37", "D38", "D39", "D4", "D40", "D41", "D42", "D43", "D44", "D45",
  "D46", "D47", "D48", "D49", "D5", "D50", "D51", "D52", "D53", "D54", "D55",
  "D56", "D57", "D58", "D59", "D6", "D60", "D61", "D62", "D63", "D64", "D65",
  "D66", "D67", "D68", "D69", "D7", "D70", "D71", "D72", "D73", "D74", "D75",
  "D76", "D77", "D78", "D79", "D8", "D80", "D81", "D82", "D83", "D84", "D85",
  "D86", "D87", "D88", "D89", "D9", "D90", "D91", "D92", "D93", "D94", "D95",
  "D96", "D97", "D98", "D99"
)

# Shuffle the textures to ensure randomness
set.seed(123) # For reproducibility
shuffled_textures <- sample(textures)

# Calculate the size of each list
total_textures <- length(shuffled_textures)
group_size <- floor(total_textures / 3)

# Split into 3 groups with the remaining textures distributed
list1 <- shuffled_textures[1:(group_size + 1)]   # First group gets one extra texture
list2 <- shuffled_textures[(group_size + 2):(2 * group_size + 1)]   # Second group gets one extra texture
list3 <- shuffled_textures[(2 * group_size + 2):total_textures]   # Third group

# Convert lists to the same format
format_list <- function(lst) {
  paste0(
    "  ", seq_along(lst) - 1, ": \"", lst, "\"",
    collapse = ",\n"
  )
}

# Format the output
formatted_list1 <- paste0("var textures_list1 = {\n", format_list(list1), "\n};\n")
formatted_list2 <- paste0("var textures_list2 = {\n", format_list(list2), "\n};\n")
formatted_list3 <- paste0("var textures_list3 = {\n", format_list(list3), "\n};\n")

# Combine and print
cat(formatted_list1, "\n")
cat(formatted_list2, "\n")
cat(formatted_list3, "\n")
