Feature: To filter and validate specific data

  Background:
    * url apiUrl

  Scenario: Get posts from a specific user
    Given path 'posts'
    And param userId = 1
    When method GET
    Then status 200
    And match each response[*].userId == 1

  Scenario: Validate a specific post
    Given path 'posts'
    And param userId = 10
    When method GET
    Then status 200
    And match response.id == 10
    And match response.title == '#string'
