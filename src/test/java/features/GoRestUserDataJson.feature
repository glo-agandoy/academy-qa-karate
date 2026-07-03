Feature: Validacion De Flujos Con Datos Externos Json En GoRest

  Background:
    Given url urlBaseGoRest
    * configure headers = { Authorization: '#(tokenGoRest)' }

    * def fullData = read('UserData.json')

    * def generarEmailDinamico =
    """
    function() {
      var num = Math.floor(Math.random() * 99999);
      return 'testUser' + num + '@ejemplo.com';
    }
    """
    * def emailDinamico = generarEmailDinamico()

  @positiva
  Scenario: Validar Ciclo De Vida Completo Utilizando Datos Del Json

    Given path 'users'
    * def bodyRequest = fullData.usuarioValido
    * set bodyRequest.email = emailDinamico

    And request bodyRequest
    When method POST
    Then status 201
    And match response.name == bodyRequest.name
    And match response.email == emailDinamico

    * def createdId = response.id

    Given path 'users', createdId
    * def bodyUpdate = fullData.datosParaActualizar

    And request bodyUpdate
    When method PATCH
    Then status 200
    And match response.name == bodyUpdate.name
    And match response.status == bodyUpdate.status

    Given path 'users', createdId
    When method DELETE
    Then status 204

    Given path 'users', createdId
    When method GET
    Then status 404
    And match response.message == 'Resource not found'


  @userData @masivo
  Scenario Outline: Validar Creacion Dinamica Del Usuario: <name>

    * print 'Paso 1: Configurar peticion masiva para el usuario ->', '<name>'
    * def emailDinamicoFila = generarEmailDinamico()
    Given path 'users'
    * def bodyRequest = __row
    * set bodyRequest.email = emailDinamicoFila

    And request bodyRequest
    When method POST
    Then status 201

    * print 'Paso 2: Validar que la API guardo correctamente a', '<name>'
    And match response.name == '<name>'
    And match response.gender == '<gender>'
    And match response.email == emailDinamicoFila

    Examples:
      | read('UserData.json').massUsers |