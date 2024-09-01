@WireMock
@WorkInProgress
Feature: Mock Rest server

  Usage:
    gradlew testspec -Dfeatures=features/rest/MockServer.feature
    gradlew testspec -Dfeatures=features/rest -Dparallel=true

  This feature sets mock service one in Background.
  This way each Scenario is guaranteed to have it setup when running in parallel mode.
  Repeated requests to start mock server do not create a new Mock server and do NOT fail.
  Step "I start REST mock service tester on port 9191" is thread-safe.

  This approach works in parallel mode only if stubs don't change throughout the execution.

  Background: Start REST mock
    # Given service should not be running on localhost:9191
    Given I start REST mock service tester on port 9191
    # Then service should be running on localhost:9191
    And I stub REST mock service tester as:
    """
    {
      "request" : {
        "method" : "GET",
        "urlPath" : "/test"
      },
      "response" : {
        "status" : 200,
        "body" : "{ \"result\" : \"all good\" }",
        "headers" : { "content-type" : "application/json" }
      }
    }
    """


  Scenario: Call mock directly - existing endpoint
    When I send GET request to 'http://localhost:9191/test'
    Then rest response status == 200
     And rest response json.result == "all good"


  Scenario: Call mock directly - non-existing endpoint
    When I send GET request to http://localhost:9191/another
    Then rest response status == 404


#  Scenario: Stop REST mock
#    When I stop REST mock service tester
#    Then service should not be running on localhost:9191
#
#
#  @wip
#  @Ignore
#  Scenario: 'GET https://postman-echo.com/get'
#    When I send GET request to 'https://postman-echo.com/get'
#    Then rest response status == 200

#  String postBody = ""
#  + "Releases\n"
#  + "--------\n"
#  + "\n"
#  + " * _1.0_ May 6, 2013\n"
#  + " * _1.1_ June 15, 2013\n"
#  + " * _1.2_ August 11, 2013\n";
#
#  Request request = new Request.Builder()
#  .url("https://api.github.com/markdown/raw")
#  .post(RequestBody.create(MEDIA_TYPE_MARKDOWN, postBody))
#  .build();
#
#  try (Response response = client.newCall(request).execute()) {
#  if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);
#    System.out.println(response.body().string());
#  }
