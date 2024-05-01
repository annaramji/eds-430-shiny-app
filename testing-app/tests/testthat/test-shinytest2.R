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
