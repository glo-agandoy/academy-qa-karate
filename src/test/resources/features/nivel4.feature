Feature: Nivel 4 - PUT y DELETE
  Background: Configuración inicial
    * url apiUrl

  Scenario: Ejercicio 8 - Utilizar PUT para modificar información existente
    * def putPayload =
    """
    {
      "id": 1,
      "userId": 1,
      "title": "Exercise 8",
      "body": "Creating modification"
    }
    """

    Given path 'posts','1'
    And request putPayload
    When method PUT
    Then status 200
    And match response.title == putPayload.title
    And match response.body == putPayload.body
    And match response.id == 1

  Scenario: Ejercicio 9 - Eliminar un post

    Given path 'posts','1'
    When method DELETE
    Then status 200
    And match response == {}