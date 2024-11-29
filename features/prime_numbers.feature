Feature: Prime Number Validation

  Scenario Outline: Check if a number is prime
    Given a number <number>
    When I check if the number is prime
    Then the prime number result should be "<result>"

    Examples:
      | number | result    |
      | -7     | Falso     |
      | 0      | Falso     |
      | 2      | Verdadero |
      | 4      | Falso     |
      | 17     | Verdadero |


