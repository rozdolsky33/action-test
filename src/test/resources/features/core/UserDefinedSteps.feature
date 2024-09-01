Business Need: To allow user to create own custom step definitions

  Usage:
    gradlew testspec -Dfeatures=features/core/UserDefinedSteps.feature

  Scenario: Using steps defined in Groovy class
    When I add 3 and 5 on calculator
    Then calculator should return 8


  Scenario: Using steps defined in Java class
    When I append to console "Java steps work!"


  @ShouldFail
  Scenario: With failed step
    Then calculator should return 7
