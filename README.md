
# Adidas Challenge

This is the project for the first exercise - REST API Automation



These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.


How to run the automated tests for this system

To run a specific feature test (specific runner class):
```
mvn verify -Dit.test=victoria.adidas.runners.pet.getPet.GetPetAPI
```

To run a specific feature test with values for an environment:
```
mvn verify -Denv=prod -Dit.test=victoria.adidas.runners.pet.getPet.GetPetAPI
```

To run all automated tests for this exercise:
```
mvn verify -Denv=prod -Dit.test=victoria.adidas.runners.pet.getPet.GetPetAPI
mvn verify -Denv=prod -Dit.test=victoria.adidas.runners.pet.createPet.CreatePetAPI
```
  
More information on how to run automated tests can be found [here](https://github.com/veepee-oss/gingerspec/wiki/Running-your-tests)

You could see all the features developed in Gherkin in the following path:
```
/src/test/resources/features/pet/
```


* 1.0.0
    * Exercise 1 - REST API Automation finished
    


* **Victoria Lopez Valencia** - *Quality Assurance* -

  
  
This module depends on the GingerSpec framework (QA testing library), where common logic and steps are implemented. 
  
Check more information about the GingerSpec framework [here](https://github.com/veepee-oss/gingerspec/wiki)  
