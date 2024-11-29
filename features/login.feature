Feature: Login functionality

  Scenario Outline: User attempts to login with different credentials
    Given I am on the login page
    When I login with username "<username>" and password "<password>"
    Then I should see a message "<message>"

    Examples:
      | username  | password     | message                                 |
      |           | testpassword | Username must be present                |
      | testuser  |              | Password must be present                |
      |           |              | Please enter both username and password |
      | incorrect | incorrect    | Username o Password incorrect           |



