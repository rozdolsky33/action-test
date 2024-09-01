Feature: Read Examples data input from a file

  Usage:
    ./gradlew testspec -Dfeatures=features/core/ExamplesInFeature.feature

  Scenario Outline: Examples in feature
    When I execute command: <Command>
    Then last command STDOUT should contain <Expected STDOUT>

    Examples:
      | Command  | Expected STDOUT |
      | echo One | One             |
      | echo Two | Two             |
