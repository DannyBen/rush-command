Feature: Version

Scenario: rush PACKAGE with RUSH_REPO environment
  Given the variable "RUSH_REPO" is "dannyben"
   When I run "rush hello"
   Then the output should say "What's the rush?"
    And the output should say "dannyben/rush/master/hello"

Scenario: rush PACKAGE without RUSH_REPO environment
  Given the variable "RUSH_REPO" is empty
   When I run "rush hello"
   Then the output should say "rush REPO PACKAGE"

Scenario: rush USER PACKAGE
  Given the variable "RUSH_REPO" is empty
   When I run "rush dannyben hello"
   Then the output should say "What's the rush?"
    And the output should say "dannyben/rush/master/hello"

Scenario: rush USER/REPO PACKAGE
  Given the variable "RUSH_REPO" is empty
   When I run "rush dannyben/rush hello"
   Then the output should say "What's the rush?"
    And the output should say "dannyben/rush/master/hello"

Scenario: rush REPO PACKAGE when RUSH_REPO is also set
  Given the variable "RUSH_REPO" is "something-unfoundable"
   When I run "rush dannyben hello"
   Then the output should say "What's the rush?"
    And the output should say "dannyben/rush/master/hello"

Scenario: rush .PACKAGE
  Given the variable "RUSH_REPO" is "dannyben"
   When I run "rush .hello"
   Then the output should say "Sample package"

Scenario: rush /PACKAGE/FILE
  Given the variable "RUSH_REPO" is "dannyben"
   When I run "rush /hello/main"
   Then the output should say "echo \"What's the rush?\""


