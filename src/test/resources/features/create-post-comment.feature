Feature: POST requests

  Background:
    * url apiUrl


  Scenario: Create new post
    * def body = read('classpath:data/newPost.json')
    Given path 'posts'
    And request body
    When method POST
    Then status 201
    And match response.id != null
    And match response.title contains 'Lorem Ipsum'


  Scenario: Create comment in post
    * def comment =
      """
      {
        "postId": 1,
        "name": "Comentario de prueba",
        "email": "usuario@test.com",
        "body": "Este es un comentario"
      }
      """
    Given path 'comments'
    When method POST
    Then status 201
    And match response.email == '#regex ^[\\w\\.-]+@[\\w\\.-]+\\.\\w{2,}$'
    And match response.postId == comment.postId
