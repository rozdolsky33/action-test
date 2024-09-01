Feature: WEB: TodoMVC

  Usage:
    gradlew testspec -Dfeatures=features/web/TodoMVC.feature -Dbrowser=chrome

  Scenario: Navigate to target page
    When I navigate to https://todomvc.com/
    Then page title should contain 'TodoMVC'

    When I click on React
    Then page should contain text: 'todos'


  @Screenshot
  Scenario: Add TODO items
    When I click on 'What needs to be done?'
    When I enter 'First task' into 'What needs to be done?'
     And I press key ENTER
    Then page should contain text: 'First task'
