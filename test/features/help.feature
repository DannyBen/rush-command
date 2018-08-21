Feature: Help

Scenario: Run rush
   When I run "rush"
   Then the output should say "Usage:"
    And the output should say "rush -h | --help"
    And the output should not say "either a GitHub user or a full URL to any site"

Scenario: Run rush --help
   When I run "rush --help"
   Then the output should say "Usage"
    And the output should say "either a GitHub user or a full URL to any site"
