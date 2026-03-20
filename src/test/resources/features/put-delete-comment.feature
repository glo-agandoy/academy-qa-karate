Feature: PUT and DELETE comment

  Background:
    * url apiUrl


  Scenario: PUT new info into post
    * def body = read('classpath:data/putNewPost.json')
    Given path 'posts/1'
    And request body
    When method PUT
    Then status 200
    And match response.title contains 'Lorem Ipsum'
    And match response.body contains 'Lorem ipsum dolor sit amet'


  Scenario: DELETE comment in post
    Given path 'posts/1'
    When method DELETE
    Then status 200
    And match response == {}
