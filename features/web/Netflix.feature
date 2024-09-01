@WIP
Feature: WEB: Netflix

  Usage:
    gradlew testspec -Dfeatures=features/web/Netflix.feature -Dbrowser=chrome -Denv=QA2
    gradlew testspec -Dfeatures="features/web/Netflix.feature" -Dbrowser=chrome


  Scenario: Setup
    Given I import files features/web/Neflix.dictionary
     # And I import files features/env/${systemProp.env}.dictionary

  @screenshot
  Scenario: Login to Netflix
    When I navigate to https://www.netflix.com/
    Then page title should contain 'Watch Movies'
     And I optionally click on 'Accept'

    When I click on "Sign In"
     # TODO: this is where we get stuck. How does UILicious knows what is "Email" ?
     And I enter "hello@spectest.com" into "Email or phone number"
     And I enter "secret" into Password input box
     And I click on "Sign In button"
    Then page should contain text: "Sorry"
    # TODO: fix, a Step below causes HTML report to be messed up
    # Then page should contain text: "Sorry, we can't find an account with this email address."
