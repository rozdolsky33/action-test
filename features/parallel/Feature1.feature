@regression
Feature: Feature 1

  Usage:
    gradlew testspec -Dfeatures=features/parallel/Feature1.feature -Dbrowser=chrome

  @screenshot
  Scenario: Ensure that stack overflow question page 1 can be opened
    When I navigate in browser to Stack Overflow question page 1
    Then I verify Stack Overflow question page 1 is opened


  @ShouldFail
  Scenario: Ensure that stack overflow question page 2 can be opened (force scenario to fail)
    When I navigate in browser to Stack Overflow question page 2
    Then I verify Stack Overflow question page 3 is opened


  @excluded
  Scenario: This feature will be excluded
    When I navigate in browser to Stack Overflow question page 1
    Then I verify Stack Overflow question page 1 is opened
