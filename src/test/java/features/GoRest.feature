Feature: Workflow Completo CRUD De Usuarios En GoRest

  Background:
    Given url urlBaseGoRest
    * configure headers = { Authorization: '#(tokenGoRest)' }

    * def generarEmailDinamico =
    """
    function() {
      var num = Math.floor(Math.random() * 9999);
      return 'testUser' + num + '@ejemplo.com';
    }
    """
    * def emailDinamico = generarEmailDinamico()

  @workflowCompleto
  Scenario: Crear Modificar Y Eliminar Un Usuario Exitosamente

    Given path 'users'
    And request
    """
    {
      "name": "Carlos Tester",
      "gender": "male",
      "email": "#(emailDinamico)",
      "status": "active"
    }
    """
    When method POST
    Then status 201
    And match response.email == emailDinamico

    * def userId = response.id

    Given path 'users', userId
    And request { "name": "Super Tester", "status": "inactive" }
    When method PUT
    Then status 200
    And match response.name == 'Super Tester'
    And match response.status == 'inactive'

    Given path 'users', userId
    When method DELETE
    Then status 204

    Given path 'users', userId
    When method GET
    Then status 404
    And match response.message == 'Resource not found'