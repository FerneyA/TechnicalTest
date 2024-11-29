Feature: Sort Words Alphabetically

  Scenario: Sort a string of words
    Given the sentence "perro gato casa"
    When I sort the words alphabetically
    Then the sorted result should be "casa gato perro"

  Scenario: Sort a string of words
    Given the sentence "Zorro Asno ave zebra"
    When I sort the words alphabetically
    Then the sorted result should be "Asno Zorro ave zebra"
