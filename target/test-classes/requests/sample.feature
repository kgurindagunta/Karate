Feature: Testing

  Background: 
    Given url baseUrl

  Scenario: update request
    #Given url 'https://reqres.in/api/users/2'
    And path '2'
    And request {"name": "kiran", "job": "QA Engineer"}
    When method put
    Then status 200
    And print responseHeaders
    And print responseTime
    And print responseStatus
    And print responseHeaders

  Scenario: Delete request
    And path '2'
    When method delete
    Then status 204

  Scenario: Delete request having dynamic id
    And request {"name": "kiran", "job": "QA engineer"}
    When method post
    Then status 201
    * def id = response.id
    * print id
    Given url baseUrl
    And path 'id'
    When method delete
    Then status 204

  #assertions
  Scenario: Assertions
    And param page = 2
    When method get
    Then status 200
    And print response
    And match response.per_page == 6
    And match response.data == '#[6]'
    And match response.data[*].id contains [7, 8, 9]
    And match response.data[*].id contains any [5, 6, 7]
    And match response.data[*].first_name contains 'Rachel'
    And match response..last_name contains 'Ferguson'
  
  Scenario: Post with config.js file
    #And request {"name": "#(userName)", "job": "#(job)"}
    And request {"name": "#(titleName)", "job": "#(job)"}
    When method post
    Then status 201
    And print response
  
  @sanity
  Scenario Outline: Data driven request
    And request {"name": "<nameTitle>", "job": "<jobTitle>"}
    When method post
    Then status 201
    And print response

    Examples: 
      | nameTitle | jobTitle           |
      | Kiran     | QA Engineer        |
      | Jitendra  | Senior QA Engineer |
