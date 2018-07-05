theme_set(theme_fivethirtyeight())

# Theme Overrides
theme_update(plot.title = element_text(hjust = 0.5),
             axis.text.x = element_text(face = "bold", size = 12),
             axis.text.y = element_text(face = "bold", size = 12),
             legend.position = "top", legend.title = element_blank())
