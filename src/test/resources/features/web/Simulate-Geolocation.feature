@WIP
@Screenshot
Feature: Web: Simulate Geolocation in Chrome

  TODO: how to verify? Navigate to Ukraine Google web site?

  Usage:
    gradlew testspec -Dfeatures=features/web/Simulate-Geolocation.feature -Dbrowser=localhost:chrome
    gradlew testspec -Dfeatures=features/web/Simulate-Geolocation.feature -Dbrowser=amazonfarm:firefox

  Background:
    Given I import files features/web/google.dictionary


  Scenario: Geolocation simulation in Chrome via DevTools - US
    When I navigate to Google landing page
    # And I simulate geolocation as: latitude = 35.8235, longitude = -78.8256, accuracy = 100
    Then page title should be "Google"

    When I enter "Maven h2" into Google Search input box
     And I click on Google Search button
    Then page title should be "Maven h2 - Google Search"
     And page should contain text: 'Build - H2 Database Engine'


  # "I simulate geolocation" not implemented
  @Ignore
  Scenario: Geolocation simulation in Chrome via DevTools - Poland
    Given I simulate geolocation as: latitude = 52.23033133497268, longitude = 21.012438180305203, accuracy = 100

    When I navigate to Google landing page
    Then page title should be "Google"

    When I enter "Maven h2" into Google Search input box
     And I click on Google Search button
     # should fail below because title contains Polish words:
    Then page title should be "Maven h2 - Szukaj w Google"
     # And page should contain text: 'Build - H2 Database Engine'


#  Scenario: Geolocation simulation in Chrome via DevTools - Poland
#    Given I simulate geolocation as: latitude = 52.23033133497268, longitude = 21.012438180305203, accuracy = 100
#
#    When I navigate to http://www.amazon.com
#    Then page title should be "Amazon"
#     And I wait for 15 seconds
#    When I enter "Maven h2" into Google Search input box
#    And I click on Google Search button
#    Then page title should be "Maven h2 - Google Search"
#    And page should contain text: 'Build - H2 Database Engine'


