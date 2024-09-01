@Ignore
Ability: to enter test into HTML form

  Usage:
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=chrome
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=edge
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=firefox

    or:
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=localhost:chrome
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=localhost:edge
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=localhost:firefox

    or in a grid:
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=saucelabs:Windows_7-chrome-92
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=saucelabs:Windows_10-firefox-latest
    gradlew testspec -Dfeatures="features/web/NewWave.feature" -Dbrowser=saucelabs:macOS_11.00-safari-14


  Scenario: Setup
    Given I import files features/web/NewWave.dictionary


  Scenario: Basic form entry method
    When I navigate to New Ukrainian Wave landing page
    Then page title should contain 'New Ukrainian Wave'
     And page should contain text: UKRAINIAN WORLD CONGRESS
    # And element 'Login Button' should be displayed


#  Scenario: Login with missing password
#    When I enter Ed Dushak into Email input
#    Then web element Email input should contain value 'Ed'
#    Then web element Email input should have value 'Ed Dushak'
#    Then web element Email input should match value '(.*)Dushak'
#
#    When I click on 'Login Button'
#    # And I wait for 5 seconds <- explicit waiting is BAD!
#    Then page should contain text: 'Check you login and password'
