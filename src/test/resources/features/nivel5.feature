Feature: Nivel 5 - Ejercicio Final CRUD con Petstore

  Background:
    * url petstoreUrl

  Scenario Outline: Validar mascotas por estado (GET)
    Given path 'pet', 'findByStatus'
    And param status = estadoBuscado
    When method get
    Then status 200

    Examples:
      | estadoBuscado |
      | 'available'   |
      | 'pending'     |

  @regression
  Scenario: Flujo CRUD de una mascota
    * call read('classpath:features/crear-mascota.feature')

    Given path 'pet', '12345'
    When method get
    Then status 200
    And match response.name == "Firulais"

    Given path 'pet'
    And request { "id": 12345, "name": "Balto", "status": "sold" }
    When method put
    Then status 200
    And match response.name == "Balto"

    Given path 'pet', '12345'
    When method delete
    Then status 200