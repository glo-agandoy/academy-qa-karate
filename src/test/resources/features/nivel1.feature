Feature: Petición GET
Background: Configuración inicial
   * url apiUrl

Scenario: Validation response
Given path 'users'
When method get
Then status 200
And match response == '#[]'
And assert response.length >= 10