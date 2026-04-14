Feature: To obtain all users

  Background:
    * url apiUrl

  Scenario: Get all users
    Given path 'users'
    When method GET
    Then status 200
    And match response.body == "#array"
    And match response.body == "#[?_ >= 10]"
