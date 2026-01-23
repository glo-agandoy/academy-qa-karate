Feature: Example

  Background: My preconditions
    * url apiUrl

  Scenario: Get todos
    Given path 'todos', '2'
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
    * def body =
      """
        {
        "title": "Karate for API testing",
        "body": "I create my first post in Karate",
        "userId": 1
        }
      """
    And request body
    When method POST
    Then status 201
    And match response.title == body.title
