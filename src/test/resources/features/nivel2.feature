Feature: Parámetros de consulta
Background: Configuración inicial
   * url apiUrl

  Scenario: Get posts from a specific user
    Given path 'posts'
    And param userId = 1
    When method GET
    Then status 200
    And match each response[*].userId == 1

  Scenario: Ejercicio 5 - Validar un post específico
    Given path 'posts', '10'
    When method get
    Then status 200
    And match response.id == 10
    And match response.title == '#string'