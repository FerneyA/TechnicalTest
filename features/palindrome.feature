Feature: Palindrome Check

  Scenario: Check if a word is a palindrome
    Given the word "radar"
    When I check if the word is a palindrome
    Then the palindrome result should be "Verdadero"

  Scenario: Check if a word is not a palindrome
    Given the word "hola"
    When I check if the word is a palindrome
    Then the palindrome result should be "Falso"
