Feature: API Testing with Reqres

  Scenario: Create a user and verify the response
    Given I initialize the API client
    When I create a user with name "Test User" and job "Automation Engineer"
    Then the response code should be 201
    And I extract the "id" from the response
    And the response should contain:
      | name | Test User           |
      | job  | Automation Engineer |


  Scenario: Fetch the created user and verify details
    Given I initialize the API client
    When I fetch the user by ID
    Then the response code should be 200
    And the response should contain:
      | id   | <id>                |
      | name | Test User           |
      | job  | Automation Engineer |

  Scenario: Validate the contract of GET /users response
    Given I initialize the API client
    When I fetch the user by ID
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
