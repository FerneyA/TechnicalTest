Feature: Login and Dashboard Verification

  Scenario: Validate dashboard information
    Given I am on the login page
    When I login with username "testuser" and password "testpassword"
    Then I should be redirected to the dashboard: "https://demo.applitools.com/hackathonAppV2.html"
    And I should see a table with 6 transactions
    And the Total balance should display "$350"
    And the Credit Available should display "$17,800"
    And all positive numbers in the table should be green
    And all negative numbers in the table should be red



