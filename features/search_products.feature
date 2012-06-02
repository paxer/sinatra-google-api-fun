Feature: Search Products

  Scenario: Search products by using Google Shopping API
    Given I have a Google API key
    When I do a search
    Then I should get the list of the products