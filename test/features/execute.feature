Feature: Version

Scenario: Run rush PACKAGE
  Given the variable "RUSH_REPO" is "dannyben"
   When I run "rush hello"
   Then the output should say "Rush is working properly"
    And the output should say "dannyben/rush/master/hello"

Scenario: Run rush PACKAGE without RUSH_REPO
  Given the variable "RUSH_REPO" is empty
   When I run "rush hello"
   Then the output should say "rush REPO PACKAGE"

Scenario: Run rush REPO PACKAGE
  Given the variable "RUSH_REPO" is empty
   When I run "rush dannyben hello"
   Then the output should say "Rush is working properly"
    And the output should say "dannyben/rush/master/hello"
