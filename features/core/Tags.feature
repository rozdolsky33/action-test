Feature: CORE steps usage examples

  Usage:
    gradlew testspec -Dfeatures=features/core/Core.feature

  @ShouldFail
  Scenario: that should be executed
    Then I execute code "to check variable":
    """
    assert 1 == 1
    """
