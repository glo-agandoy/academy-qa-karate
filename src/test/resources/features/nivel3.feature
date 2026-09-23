Feature: Nivel 3 - Peticiones POST
  Background: Configuración inicial
    * url apiUrl

  Scenario: Ejercicio 6 - Send JSON with POST
    * def postPayload = read('classpath:data/post.json')

    Given path 'posts'
    And request postPayload
    When method POST
    Then status 201
    And match response.id == '#number'
    And match response.title == postPayload.title

  Scenario: Ejercicio 7 - Create comment with POST
    * def commentPayload =
    """
    {
      "postId": 10,
      "name": "Comment",
      "email": "karater@karate.com",
      "body": "Creating comment"
    }
    """
    Given path 'comments'
    And request commentPayload
    When method POST
    Then status 201
    And match response.email == '#regex ^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$'
    And match response.postId == commentPayload.postId