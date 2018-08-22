Feature: Help

Scenario: Run rush
   When I run "rush"
   Then the output should say "Usage:"
    And the output should say "rush -h | --help"
    And the output should not say "Source repository to download from"

Scenario: Run rush --help
   When I run "rush --help"
   Then the output should say "Usage"
    And the output should say "Source repository to download from"
