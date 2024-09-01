@regression
Feature: Feature with Examples

  Usage:
    gradlew testspec -Dfeatures=features/parallel/FeatureWithExamples.feature -Dbrowser=chrome

  Background:
    Given I navigate in browser to Stack Overflow

  @screenshot
  Scenario Outline: Ensure that stack overflow question pages can be opened
    When I navigate in browser to Stack Overflow question page <page>
    Then I verify Stack Overflow question page <page> is opened

    Examples:
      | page |
      | 3    |
      | 4    |
      | 5    |