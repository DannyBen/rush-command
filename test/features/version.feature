Feature: Version

Scenario: Run rush --version
   When I run "rush --version"
   Then the output should match "\d+\.\d+\.\d+"
