library(DiagrammeR)
#retrieved from https://stackoverflow.com/questions/3550341/gantt-charts-with-r
mermaid("
gantt
dateFormat  YYYY-MM-DD
title dincaslan Gantt Chart

section Main Tasks
Comparison of miseq datasets                                       :crit, active, first_1,    2020-04-10, 10d
Literature search                                                :crit, active, first_2,    2020-04-15, 15d
imageJ or alternative image processing for PhenoSeq                :crit, active, first_3,    2020-04-10, 15d
Image Processing for PhenoSeq                                      :crit, active, first_4,    2020-04-20, 5d

section Course Stuff
AQFM Spatialomics Review  Final Draft                              :active, import_1,   2020-04-14, 4d
AQFM Three Review Process                                          :active, import_2,   2020-04-15, 5d
Clinical Instirmentation Final Exam                                :active, import_3,   2020-04-22, 5d

section The Extras
Covid19 Biohackathon20                                             :active, extras_1,   2020-04-10, 3d
Learn how to focus on your studies in these days                   :active, extras_2,   2020-04-10, 3d
")


library(plotly)

df <- read.csv("GanttChart_updated.csv", stringsAsFactors = F)

df$Start  <- as.Date(df$Start, format = "%m/%d/%Y")
client    <- "Sample Client"
cols      <- RColorBrewer::brewer.pal(length(unique(df$Resource)), name = "Set3")
df$color  <- factor(df$Resource, labels = cols)

p <- plot_ly()
for(i in 1:(nrow(df) - 1)){
  p <- add_trace(p,
                 x = c(df$Start[i], df$Start[i] + df$Duration[i]), 
                 y = c(i, i), 
                 mode = "lines",
                 line = list(color = df$color[i], width = 30),
                 showlegend = F,
                 hoverinfo = "text",
                 text = paste("Task: ", df$Task[i], "<br>",
                              "Duration: ", df$Duration[i], "days<br>",
                              "Resource: ", df$Resource[i]),
                 evaluate = T
  )
}

p