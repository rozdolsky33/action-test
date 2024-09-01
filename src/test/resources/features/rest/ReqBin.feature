@Reqbin
Feature: REST examples

  Usage:
    gradlew testspec -Dfeatures=features/rest/ReqBin.feature


#  Scenario: Setup reqbin
  Background:
    Given I set base url to https://reqbin.com


  Scenario: 'GET returns XML'
    <Response>
      <ResponseCode>0</ResponseCode>
      <ResponseMessage>Success</ResponseMessage>
    </Response>
    When I send GET request to /echo/get/xml
    Then rest response status == 200
     And rest response contentType == 'application/xml; charset=utf-8'
     And rest response xml.ResponseMessage == 'Success'


  Scenario: 'POST with JSON body, returns json'
    When I send POST request with parameters to /echo/post/json as:
    """
    body = '{ "a" : "b" }'
    """
    Then rest response status == 200
     And rest response contentType == 'application/json'
     And rest response json.success == 'true'
     And rest response data.success == 'true'
     And response text should contain "success":"true"
     # would fail if enabled:
     # And rest response json.noSuchField == 'bogus'


  Scenario: 'POST with JSON body, returns json - different step'
    Given I execute code "that creates REST request body in json file":
    """
    File targetFile = new File('./build/body.json');
    targetFile.delete();
    targetFile.text = '{ "a" : "b" }';
    assert targetFile.exists()
    """

    When I send POST request with body in file build/body.json to /echo/post/json as:
    """
    requestContentType = 'application/json'
    """
    Then rest response status == 200
    And rest response contentType == 'application/json'
    And rest response json.success == 'true'
    And rest response data.success == 'true'
    And response text should contain "success":"true"
     # would fail if enabled:
     # And rest response json.noSuchField == 'bogus'

