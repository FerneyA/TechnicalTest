Feature: API Testing with Reqres

  Scenario: Create a user and verify the response
    Given I initialize the API client
    When I create a user with name "Test User" and job "Automation Engineer"
    Then the response code should be 201
    And the response should contain:
      | name | Test User           |
      | job  | Automation Engineer |
    When I fetch the user by ID
    Then the response code should be 200
    And the response should contain:
      | name | Test User           |
      | job  | Automation Engineer |
    Then the response should follow this schema:
      """
      {
        "data": {
          "id": "integer",
          "email": "string",
          "first_name": "string",
          "last_name": "string",
          "avatar": "string"
        },
        "support": {
          "url": "string",
          "text": "string"
        }
      }
      """