Feature: Validacion De Escenarios Negativos En GoRest

  Background:
    Given url urlBaseGoRest
    * configure headers = { Authorization: '#(tokenGoRest)' }

  @negativo
  Scenario: Validar Rechazo Al Crear Usuario Sin Correo Obligatorio

    Given path 'users'
    And request
    """
    {
      "name": "Usuario Incompleto",
      "gender": "male",
      "status": "active"
    }
    """
    When method POST
    Then status 422
    And match response[0].field == 'email'
    And match response[0].message == "can't be blank"

  @negativo
  Scenario: Validar Rechazo Al Enviar Datos Con Formato Incorrecto

    Given path 'users'
    And request
    """
    {
      "name": "Robot Tester",
      "gender": "cyborg",
      "email": "robot@ejemplo.com",
      "status": "active"
    }
    """
    When method POST
    Then status 422
    And match response[0].field == 'gender'
    And match response[0].message == "can't be blank, can be male of female"

  @negativo
  Scenario: Validar Bloqueo De Acceso Con Token Invalido

    * configure headers = { Authorization: 'Bearer soy_un_hacker_12345' }

    Given path 'users'
    And request
    """
    {
      "name": "Hacker",
      "gender": "male",
      "email": "hacker@ejemplo.com",
      "status": "active"
    }
    """
    When method POST
    Then status 401
    And match response.message == 'Invalid token'

  @negativo
  Scenario: Validar Respuesta Al Buscar Usuario Inexistente

    Given path 'users', '90999999999999999999999999999999999999991'
    When method GET
    Then status 404
    And match response.message == 'Resource not found'

  @negativo
  Scenario: Validar Regla De Negocio Para Correo Duplicado

    * def randomNum = Math.floor(Math.random() * 100000)
    * def emailDuplicado = 'clon' + randomNum + '@ejemplo.com'

    Given path 'users'
    And request
    """
    {
      "name": "Usuario Original",
      "gender": "male",
      "email": "#(emailDuplicado)",
      "status": "active"
    }
    """
    When method POST
    Then status 201

    Given path 'users'
    And request
    """
    {
      "name": "El Impostor",
      "gender": "female",
      "email": "#(emailDuplicado)",
      "status": "active"
    }
    """
    When method POST
    Then status 422
    And match response[0].field == 'email'
    And match response[0].message == 'has already been taken'