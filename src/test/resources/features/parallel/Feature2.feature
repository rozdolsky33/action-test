@regression
Feature: Feature 2

  Usage:
    gradlew testspec -Dfeatures=features/parallel/Feature2.feature -Dbrowser=chrome

  @screenshot
  Scenario: Ensure that stack overflow question page 2 can be opened
    When I navigate in browser to Stack Overflow question page 2
    Then I verify Stack Overflow question page 2 is opened