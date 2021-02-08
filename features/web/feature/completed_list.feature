Feature: Completed list
  Background:
    Given empty ToDo list
    And I add task "completed task"
    And I complete task #1

  Scenario: Completed list has only completed tasks
    Given I add task "Active task"
    When I visit page /#/completed
    Then ToDo list has 1 task(s)
    * task #1 is "completed task"
    * task #1 marked as completed