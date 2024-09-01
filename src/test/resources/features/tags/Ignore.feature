Feature: TAGS - steps usage examples

  Usage:
    gradlew testspec -Dfeatures=features/tags/Ignore.feature


  Scenario: "The one that should run"
    Then I execute code "a simple assert":
    """
    assert 3+4 == 7
    """

  @Ignore
  Scenario: "The one that should NOT run - because of @Ignore tag"
    Then I execute code "a simple assert":
    """
    assert 3+4 == 7
    """
