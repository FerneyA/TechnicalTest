Feature: Find Two Numbers That Sum to Target

  Scenario: Find a pair of numbers in a list that sums to the target
    Given the list "[1, 2, 3, 4, 5]"
    And the target 9
    When I find the two numbers that sum to the target
    Then the two sum result should be "[4, 5]"

  Scenario: No pair found
    Given the list "[1, 2, 3]"
    And the target 10
    When I find the two numbers that sum to the target
    Then the two sum result should be None
