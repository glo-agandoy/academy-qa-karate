Feature: Get all users

  Background:
    * url apiUrl

  Scenario: Get posts of an user
    Given path 'posts'
    And param userId = 1
    When method GET
    Then status 200
    #And match response == '#array'
    #And match each response.userId == 1
    And match each response[*].userId == 1


  Scenario: Validate a post
    Given path 'posts'
    And param id = 10
    When method GET
    Then status 200
    And match response.title == '#string'
    And match response.id == 10