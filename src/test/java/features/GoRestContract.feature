Feature: Validacion De Contrato En GoRest

  Background:
    Given url urlBaseGoRest
    * configure headers = { Authorization: '#(tokenGoRest)' }

  @contrato
  Scenario: Validar Esquema Json Estricto De Usuarios

    * def userSchema =
    """
    {
      "id": '#number',
      "name": '#string',
      "email": '#regex ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,50}$',
      "gender": '#regex ^(male|female)$',
      "status": '#regex ^(active|inactive)$'
    }
    """

    Given path 'users'
    When method GET
    Then status 200
    And match each response == userSchema