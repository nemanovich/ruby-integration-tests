Feature: Task operations
  Background:
    Given empty ToDo list

  Scenario: Add first task to list
    When I add task "test 1"
    Then ToDo list has 1 task(s)
    And task #1 is "test 1"

  Scenario: Add second task to list
    Given I add task "test 1"
    When I add task "test 2"
    Then ToDo list has 2 task(s)
    * task #1 is "test 1"
    * task #2 is "test 2"

  Scenario: Delete task
    Given I add task "for delete"
    When I delete task #1
    Then ToDo list is empty

  Scenario: Complete task
    Given I add task "for complete"
    When I complete task #1
    Then task #1 marked as completed