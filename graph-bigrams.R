# Library -----------------------------------------------------------------

library(tidyr)   # For data manipulation
library(igraph)  # For igraph transformation
library(ggraph)  # For network graphing


# Load and Clean Data -----------------------------------------------------

# Read data
idquery <- read.csv("idquery.csv", fileEncoding = "UTF-8-BOM")
names <- read.csv("names.csv", fileEncoding = "UTF-8-BOM", na.strings = NULL)

# Per request, merge records by ID. Concatenate the query terms.
cidquery <- idquery %>%
  group_by(ID) %>%
  summarise(Query = paste(Query, collapse = ", "))

# Save the merged records for another analysis.
write.csv(cidquery, "cidquery.csv")

# Get Bigrams -------------------------------------------------------------

# Collect and count the bigrams.
bigrams <- cidquery %>%
unnest_tokens(bigram, Query, token = "ngrams", n = 2) %>%
  count(bigram, sort = TRUE) %>%
  separate(col = bigram, into = c("left", "right"))

# Replace abbreviated queries with full query terms, for easier graph reading.
bigrams$left <- names$full[match(bigrams$left, names$abb)]
bigrams$right <- names$full[match(bigrams$right, names$abb)]


# Graph -------------------------------------------------------------------

# Transform the dataframe into an igraph list.
bigram_graph <- bigrams %>%
  graph_from_data_frame()

# Graph the bigrams
ggraph(bigram_graph, layout = "fr") +
  geom_edge_link(aes(edge_alpha = n)) +
  geom_node_point(color = "lightblue", size = 5) +
  geom_node_text(aes(label = name), vjust = 1, hjust = 1) +
  theme_void()

ggsave("bigram.png")

