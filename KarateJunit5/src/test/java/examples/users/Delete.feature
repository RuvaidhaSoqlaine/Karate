Feature: Validating The Delete Request 
@Delete
Scenario: Automating The <Name> With Test Case ID - <ID> 
	Given url baseURL 
	And print Name
	When method DELETE 
	Then status 204
	