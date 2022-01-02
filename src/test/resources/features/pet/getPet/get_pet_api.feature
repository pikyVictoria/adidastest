@rest
Feature: Testing the Get Pets endpoint

  Use the following command in the terminal to execute automated tests: mvn verify -Denv=prod -Dit.test=victoria.adidas.runners.pet.getPet.GetPetAPI

  Scenario: Get "available" pets
    Given I securely send requests to '${envProperties:petstore.url}'
    When I set url parameters:
      | status | available |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '200'
    Then I save element '$' in environment variable 'response'
    And 'response' matches the following cases:
      | $[0].status | equal | available |


  Scenario: Try to get pets with not valid status (like "not_available")
    Given I securely send requests to '${envProperties:petstore.url}'
    When I set url parameters:
      | status | not_available |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '200'


  Scenario: Try to get pets with not valid param (like "stat")
    Given I securely send requests to '${envProperties:petstore.url}'
    When I set url parameters:
      | stat | available |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '200'