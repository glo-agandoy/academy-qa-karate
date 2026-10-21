Feature: Crear mascota (POST)

  Scenario: POST básico
    Given url petstoreUrl
    And path 'pet'
    And request { "id": 12345, "name": "Firulais", "status": "available" }
    When method post
    Then status 200