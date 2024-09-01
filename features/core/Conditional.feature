Feature: CORE - Scenarios that are skipped at runtime

  Usage:
    gradlew testspec -Dfeatures=features/core/Conditional.feature


  @RunIf(true)
  Scenario: that should be executed
    Then I execute code "to check variable":
    """
    assert 1 == 1
    """


  @RunIf(false) @ShouldSkip
  Scenario: that should be skipped
    Then I execute code "to check variable":
    """
    assert 1 == 1
    """
    Then I execute code "to check variable":
    """
    assert 1 == 1
    """
    Then I execute code "to check variable":
    """
    assert 1 == 1
    """


  @RunIf(true)
  Scenario: that should be executed
    Then I execute code "to check variable":
    """
    assert 1 == 1
    """
