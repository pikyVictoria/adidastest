@rest
Feature: Testing the Post, Put and Delete Pets endpoint

  Use the following command in the terminal to execute automated tests: mvn verify -Denv=prod -Dit.test=victoria.adidas.runners.pet.createPet.CreatePetAPI

  Scenario: Create, update and delete new pet with valid data
    #Post a new available pet to the store
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/pet' based on 'schemas/createPet.json' as 'json' with:
      | $.category.name | UPDATE | Cat |
      | $.name          | UPDATE | Doraemon |
      | $.tags.[0].name | UPDATE | cartoon_cat |
      | $.status        | UPDATE | available   |
    Then the service response status must be '200'
    Then I save element '$' in environment variable 'response'
    And 'response' matches the following cases:
      | $.category.name | equal | Cat |
      | $.name          | equal | Doraemon |
      | $.tags.[0].name | equal | cartoon_cat |
      | $.status        | equal | available   |
    And I save element '$.id' in environment variable 'ID_NEW_PET'
    #Update the this pet status to 'sold'
    When I send a 'PUT' request to '/pet' based on 'schemas/updatePet.json' as 'json' with:
      | $.id | UPDATE | ${ID_NEW_PET} |
      | $.status | UPDATE | sold      |
    Then the service response status must be '200'
    Then I save element '$' in environment variable 'response'
    And 'response' matches the following cases:
      | $.id | equal | ${ID_NEW_PET} |
      | $.status | equal | sold      |
    #Delete this pet
    When I send a 'DELETE' request to '/pet/${ID_NEW_PET}'
    Then the service response status must be '200'
    Then I save element '$' in environment variable 'response'
    And 'response' matches the following cases:
      | $.code | equal | 200 |
      | $.message   | equal | ${ID_NEW_PET} |
