Feature: Get all users

  Background:
    * url apiUrl

  Scenario: Get ALL users
    Given path 'users'
    When method GET
    Then status 200
    And match response == '#[]'
    And match response  == '#[10]'