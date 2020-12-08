
# Load Libraries ----------------------------------------------------------
 

library(tidyverse)
library(knitr)
install.packages("farver")


# Load Data ---------------------------------------------------------------


leicester_2011OAC <- read_csv("2011_OAC_Raw_uVariables_Leicester.csv")
leicester_lookup <- read_csv("2011_OAC_Raw_uVariables_Lookup (1).csv")


# Bar graph ---------------------------------------------------------------


leicester_2011OAC %>%
  ggplot2::ggplot(
    aes(
      x = u011
    )
  ) +
  ggplot2::geom_histogram(binwidth = 5) +
  ggplot2::theme_bw()


# Stacked bar graph -------------------------------------------------------


leicester_2011OAC %>%
  ggplot2::ggplot(
    aes(
      x = u011,
      fill = fct_reorder(supgrpname, supgrpcode)
    )
  ) +
  ggplot2::geom_histogram(binwidth = 5) +
  ggplot2::ggtitle("Leicester’s young adults") +
  ggplot2::labs(
    fill = "2011 Output Area\nClassification\n(supergroups)"
  ) +
  ggplot2::xlab("Residents aged 20 to 24") +
  ggplot2::ylab("Count") +
  ggplot2::scale_fill_manual(
    values = c("#e41a1c", "#f781bf", "#ff7f00", "#a65628", "#984ea3", "#377eb8", "#ffff33")
  ) +
  ggplot2::theme_bw()



# Box plot ----------------------------------------------------------------

leicester_2011OAC %>%
  ggplot2::ggplot(
    aes(
      x = fct_reorder(supgrpname, supgrpcode),
      y = u011,
      fill = fct_reorder(supgrpname, supgrpcode)
    )
  ) +
  ggplot2::geom_boxplot() +
  ggtitle("Leicester’s young adults") +
  ggplot2::labs(
    fill = "2011 Output Area\nClassification\n(supergroups)"
  ) +
  ggplot2::xlab("2011 Output Area Classification (supergroups)") +
  ggplot2::ylab("Residents aged 20 to 24") +
  ggplot2::scale_fill_manual(
    values = c("#e41a1c", "#f781bf", "#ff7f00", "#a65628", "#984ea3", "#377eb8", "#ffff33")
  ) +
  ggplot2::theme_bw() +
  ggplot2::theme(axis.text.x = element_text(angle = 90, hjust = 1))



# Violin plot -------------------------------------------------------------

leicester_2011OAC %>%
  ggplot2::ggplot(
    aes(
      x = fct_reorder(supgrpname, supgrpcode),
      y = u011,
      fill = fct_reorder(supgrpname, supgrpcode)
    )
  ) +
  ggplot2::geom_violin() +
  ggtitle("Leicester’s young adults") +
  ggplot2::labs(
    fill = "2011 Output Area\nClassification\n(supergroups)"
  ) +
  ggplot2::xlab("2011 Output Area Classification (supergroups)") +
  ggplot2::ylab("Residents aged 20 to 24") +
  ggplot2::scale_fill_manual(
    values = c("#e41a1c", "#f781bf", "#ff7f00", "#a65628", "#984ea3", "#377eb8", "#ffff33")
  ) +
  ggplot2::theme_bw() +
  ggplot2::theme(axis.text.x = element_text(angle = 90, hjust = 1))



# Scatterplot -------------------------------------------------------------

# Compare u011 to Total_Population.

leicester_2011OAC %>%
  ggplot2::ggplot(
    aes(
      x = Total_Population,
      y = u011,
      colour = fct_reorder(supgrpname, supgrpcode)
    )
  ) +
  ggplot2::geom_point(size = 0.5) +
  ggplot2::ggtitle("Leicester’s young adults") +
  ggplot2::labs(
    colour = "2011 Output Area\nClassification\n(supergroups)"
  ) +
  ggplot2::xlab("Total number of residents") +
  ggplot2::ylab("Residents aged 20 to 24") +
  ggplot2::scale_y_log10() +
  ggplot2::scale_colour_brewer(palette = "Set1") +
  ggplot2::scale_colour_manual(
    values = c("#e41a1c", "#f781bf", "#ff7f00", "#a65628", "#984ea3", "#377eb8", "#ffff33")
  ) +
  ggplot2::theme_bw()



# Exercise 7.1

# Question 7.1.1: Which one of the boxplot or violin plot above do you think better illustrate the different
# distributions, and what do the two graphics say about the distribution of people aged 20 to 24 in Leicester?
# Write a short answer in your RMarkdown document (max 200 words)


# The violin plot illustrates the different distributions to greater effect. The box plot shows the range and medians but is 
# not affected by the distribution of the data. The box and whisker plot implies there are more 20 to 24 years olds living in
# areas than any other OAC. However, with the violin graph we can see population being more accurately reflected. This shows 
# Cosmopolitans areas having a greater range but less densitiy. The graph shows a greater density of 20 - 24 year olds living 
# in Multicultural Metropolitans than what was impled in the box-whisker plot. 


# Question 7.1.2: Create a jittered points plot (see geom_jitter) visualisation illustrating the same data
# shown in the boxplot and violin plot above.

leicester_2011OAC %>%
  ggplot2::ggplot(
    aes(
      x = Total_Population,
      y = u011,
      colour = fct_reorder(supgrpname, supgrpcode)
    )
  ) +
  ggplot2::geom_jitter(size = 0.5) +
  ggplot2::ggtitle("Leicester’s young adults") +
  ggplot2::labs(
    colour = "2011 Output Area\nClassification\n(supergroups)"
  ) +
  ggplot2::xlab("Total number of residents") +
  ggplot2::ylab("Residents aged 20 to 24") +
  ggplot2::scale_y_log10() +
  ggplot2::scale_colour_brewer(palette = "Set1") +
  ggplot2::scale_colour_manual(
    values = c("#e41a1c", "#f781bf", "#ff7f00", "#a65628", "#984ea3", "#377eb8", "#ffff33")
  ) +
  ggplot2::theme_bw()
