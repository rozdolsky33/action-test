#@Import(features/web/google.dictionary)
Feature: WEB: Web search
  <pre>
  Pre-requisite:
    User must have bin/chromedriver.exe present in project structure.

  Usage:
    gradlew testspec -Dfeatures=features/web/WebSearch.feature -Dbrowser=localhost:chrome
    gradlew testspec -Dfeatures=features/web/WebSearch.feature -Dbrowser=localhost:firefox

    gradlew testspec -Dfeatures=features/web/WebSearch.feature -Dbrowser=amazonfarm:anyOs-chrome
    gradlew testspec -Dfeatures=features/web/WebSearch.feature -Dbrowser=amazonfarm:chrome

    gradlew testspec -Dfeatures=features/web/WebSearch.feature -Dbrowser=saucelabs:firefox
  </pre>

  Background:
    Given I import files features/web/google.dictionary


#  Scenario: Google search using raw selectors
#    When I navigate to https://www.google.com
#    Then page title should be Google
#
#    When I enter "Maven h2" into $('input[name=q]')
#     And I click on $('input[value="Google Search"]')[0]
#    Then page title should be "Maven h2 - Google Search"
#     And page should contain text: 'Build - H2 Database Engine'
#     # And web elements $('div[class="rc"] > h3[class=r]') should contain texts 'Maven Repository: com.h2database » h2','Build - H2 Database Engine'

  @Screenshot
  Scenario: Google search using variables
    When I navigate to Google landing page
    Then page title should be "Google"

    When I enter "Maven h2" into Google Search input box
     And I click on Google Search button
    Then page title should be "Maven h2 - Google Search"
#     And page should contain text: 'Build - H2 Database Engine'
#     # And web elements 'Google results titles' should contain texts 'Maven Repository: com.h2database » h2','Build - H2 Database Engine'


#  @BeforeSuite
#  @Screenshot
#  Scenario: Capture text from page
#    When I navigate to Google landing page
#    Then page title should be "Google"
#
#    When I enter "Maven h2" into Google Search input box
#    And I click on Google Search button
#    Then page title should be "Maven h2 - Google Search"
#    And page should contain text: 'Build - H2 Database Engine'
#
#    When I capture text of an element Result Stats region into ResultStats
#    Then I execute code "to verify the step above":
#    """
#    assert ResultStats != null
#    """


#  Scenario: Captured text from previous Scenario should still be visible
#    Then I execute code "to verify the step above":
#    """
#    assert ResultStats != null
#    """
