Feature: Validating The Get Request Using Karate Framework 

Background: 
	* url baseURL
Scenario: Automating The Dummy API Of Employees List From Reqres 

	Given path 'users' 
	And param page = 2 
	And print Name 
	When method GET 
	And print response 
	Then status 404 