library(shinytest2)

test_that("{shinytest2} recording: one-name-greeting", {
  app <- AppDriver$new(name = "one-name-greeting", height = 819, width = 747)
  app$set_inputs(name_input = "Anna")
  app$click("greeting_button_input")
  app$expect_values()
})


test_that("{shinytest2} recording: consecutive-name-greeting", {
  app <- AppDriver$new(name = "consecutive-name-greeting", height = 819, width = 747)
  app$set_inputs(name_input = "A")
  app$set_inputs(name_input = "Amanda")
  app$click("greeting_button_input")
  app$set_inputs(name_input = "Anna")
  app$click("greeting_button_input")
  app$expect_values()
})


test_that("{shinytest2} recording: no-name-greeting", {
  app <- AppDriver$new(name = "no-name-greeting", height = 819, width = 747)
  app$click("greeting_button_input")
  app$expect_values()
})


test_that("{shinytest2} recording: consecutive-name-greetings", {
  app <- AppDriver$new(name = "consecutive-name-greetings", height = 819, width = 747)
  app$set_inputs(name_input = "Anna")
  app$click("greeting_button_input")
  app$expect_values()
  app$set_inputs(name_input = "Ama")
  app$set_inputs(name_input = "Amanda")
  app$click("greeting_button_input")
  app$expect_values()
})
