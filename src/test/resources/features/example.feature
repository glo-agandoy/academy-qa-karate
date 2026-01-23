Feature: Example

  Background: My preconditions
    * url apiUrl

  Scenario: Get todos
    Given path 'todos', '1'
    When method GET
    Then status 200
    And match response ==
    """
      {
        "userId": "#number",
        "id": "#number",
        "title": "#string",
        "completed": "#boolean"
      }
    """

  Scenario: Post post
    Given path 'posts'
    And request
     """
    {
      "title": "Karate for API testing",
      "body": "I create my first post in Karate",
      "userId": 1
    }
    """
    When method POST
    Then status 201
    And match response.title == body.title
