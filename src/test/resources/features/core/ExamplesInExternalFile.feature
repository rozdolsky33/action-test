@Ignore
@NotImplemented
Feature: Read Examples data input from a file

  Usage:
    ./gradlew testspec -Dfeatures=features/core/ExamplesFormFile.feature

  Scenario Outline: Examples in csv file
    When I execute command: <Command>
    Then last command STDOUT should contain <Expected STDOUT>

    # add delimiter
    Examples:
      | from file                                                  |
      | src/test/resources/features/core/ExamplesCommands.csv      |
#      | src/test/resources/features/core/ExamplesCommandsPipes.csv | \|        |
