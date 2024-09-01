Feature: CORE steps usage examples

  Usage:
    gradlew testspec -Dfeatures=features/core/Core.feature


  Scenario: import scripts
    Given I import files features/core/Core.groovy,features/core/variables.dictionary,features/core/variables.properties
    Then I execute code "to verify that Core.groovy got imported":
    """
    assert add(3,4) == 7
    """

    And I execute code "to verify that variables.dictionary got imported":
    """
    assert binding.var_1   == 'value_1'
    assert binding.'var 2' == 'value 2'
    assert binding.'var 3' == 'value 3'
    assert binding[' 4u '] == ' for you '
    """

    And I execute code "to verify that variables.properties got imported":
    """
    assert binding."this.component" == '''$('#this')'''
    assert binding."that.component" == '''$('#that')'''
    assert binding."key.var1" == '''{ id -> $('div[id='+id+']') }'''
    """


  Scenario: variables created in previous Scenario are visible in this one
    Then I execute code "to check variable":
    """
    assert binding.var_1 == 'value_1'
    """

  Scenario: waiting
    Given I wait for 2 seconds
