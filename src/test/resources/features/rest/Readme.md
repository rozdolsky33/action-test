 
## Mocking Rest services 

When running in parallel mode, there is a challenge:
 - Mock is bound to a port and may be started only once
 - Multiple parallel Scenarios may access mock
 - It's impossible to tell which Scenario will be executed first in parallel mode
 
Following approach solves this conundrum:  
 - start mock service in a Background
 - define all stubs in the same background 
 - never change stubs throughout the entire test suite execution 

Rest Mock rules:
 - Step "I start REST mock service tester on port 9191" is thread-safe.
 - Repeated requests to start mock server do not create a new Mock server and do NOT fail
