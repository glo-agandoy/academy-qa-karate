Feature: to send a JSON body and validate creation responses

  Background:
    * url apiUrl

  Scenario: send a JSON body in a POST request
    Given path 'posts'
    And request read ('classpath:data/createNewPost.json')
    When method POST
    Then status 201
    And match response.id != null
    And match response.title == 'Esto es un texto de prueba para un nuevo post'

  Scenario: Validate creation responses and specific formats
    Given path 'comments'
    * def comment =
      """
        {
        "postId": 1500,
        "title": "Esto es un título de prueba para un nuevo post",
        "body": "Esto es un texto de prueba para un nuevo post",
        "email": "comentariodeprueba@postdeprueba.com"
        }
      """
    And request comment
    When method POST
    Then status 201
    And match response.email == '#regex .+@.+\\..+'
    And match response.postId == comment.postId
