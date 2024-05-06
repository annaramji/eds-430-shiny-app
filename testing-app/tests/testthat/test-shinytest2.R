library(shinytest2)

test_that("{shinytest2} recording: one-name-greeting", {
  app <- AppDriver$new(name = "one-name-greeting", height = 819, width = 747)
  app$set_inputs(name_input = "Anna")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: consecutive-name-greeting", {
  app <- AppDriver$new(name = "consecutive-name-greeting", height = 819, width = 747)
  app$set_inputs(name_input = "A")
  app$set_inputs(name_input = "Amanda")
  app$click("greeting_button_input")
  app$set_inputs(name_input = "Anna")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: no-name-greeting", {
  app <- AppDriver$new(name = "no-name-greeting", height = 819, width = 747)
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: consecutive-name-greetings", {
  app <- AppDriver$new(name = "consecutive-name-greetings", height = 819, width = 747)
  app$set_inputs(name_input = "Anna")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
  app$set_inputs(name_input = "Ama")
  app$set_inputs(name_input = "Amanda")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: upload-cols-and-data", {
  app <- AppDriver$new(name = "upload-cols-and-data", height = 819, width = 747)
  app$upload_file(csv_input = "cols-and-data1.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: upload-incorrect-cols", {
  app <- AppDriver$new(name = "upload-incorrect-cols", height = 819, width = 747)
  app$upload_file(csv_input = "incorrect-cols.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: upload-empty-file", {
  app <- AppDriver$new(name = "upload-empty-file", height = 819, width = 747)
  app$upload_file(csv_input = "empty.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: default-three-specs", {
  app <- AppDriver$new(name = "default-three-specs", height = 770, width = 894)
  app$expect_values(output = "scatterplot_output")
})


test_that("{shinytest2} recording: remove-gentoo", {
  app <- AppDriver$new(name = "remove-gentoo", height = 770, width = 894)
  app$set_inputs(penguinSpp_scatterplot_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input = c("Adelie", "Chinstrap"))
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguinSpp_scatterplot_input_open = FALSE, allow_no_input_binding_ = TRUE)
})


test_that("{shinytest2} recording: default-app-state", {
  app <- AppDriver$new(name = "default-app-state", height = 770, width = 894)
  app$expect_values()
})
