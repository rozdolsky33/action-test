@Github
Feature: REST steps usage examples - github

  Usage:
    gradlew testspec -Dfeatures=features/rest/Github.feature


#  Scenario: Setup github
  Background:
    Given I set base url to https://github.com
    Given I execute code "to set user dynamically":
    """
    user = 'edushak'
    """


  Scenario: simple GET with fixed endpoint
    When I send GET request to /edushak
    Then rest response status == 200


#  Scenario: simple GET with parametrized endpoint
#    Note: variable $user is set in previous Scenario
#
#    When I send GET request to https://github.com/$user
#    Then rest response status == 200
#
#
#  Scenario: GET with headers
#    HTTP headers values passed are ignored by server in this case
#
#    When I send GET request with parameters to https://github.com/$user as:
#    """
#    headers = ['key' : 'value']
#    """
#    Then rest response status == 200
#     And rest response contentType == 'text/html; charset=utf-8'
#     And rest response contentType should contain 'text/html'
#
#     And response text should contain 'Popular repositories'
#     And response text should contain Popular repositories
#
#     And response text should not contain 'some other project name'
#
#
#  @Ignore
#  Scenario: Unfinished, should not run
#    When I send GET request to https://.....
#    Then rest response status == ???
