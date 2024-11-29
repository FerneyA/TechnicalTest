Feature: Fibonacci Sequence

  Scenario: Generate the Fibonacci sequence for a valid number
    Given a number 5
    When I generate the Fibonacci sequence
    Then the Fibonacci result should be "[0, 1, 1, 2, 3]"

  Scenario: Handle edge case for zero
    Given a number 0
    When I generate the Fibonacci sequence
    Then the Fibonacci result should be "[0]"

  Scenario: Handle edge case for one
    Given a number 1
    When I generate the Fibonacci sequence
    Then the Fibonacci result should be "[0, 1]"

  Scenario: Handle edge case for negative numbers
    Given a number -3
    When I generate the Fibonacci sequence
    Then the Fibonacci result should be "[]"
