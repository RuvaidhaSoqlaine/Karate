Feature: Validating The Put Request 

Background: 
	* url 'https://reqres.in/api/'
	* def output = read('info.json')
@Put1
Scenario Outline: Automating The <Name> With Test Case ID - <ID> 
	Given url 'https://reqres.in/api/users/2' 
	And request { "name" :"Mahesh", "job" : "Software"} 
	When method PUT 
	Then status 200 
	
	Examples: 
		| Name     | ID      |
		| "Reqres" | "14538" |
	@ResponsePut	
	Scenario Outline: Automating The <Name> With Test Case ID - <ID> 
		Given path 'users/2' 
		And request { "name" :"Mahesh", "job" : "Software"} 
		When method PUT 
		Then status 200 
		And print response
		And match $ == { "name": "#string", "job": "#string", "updatedAt": "#ignore"}
		
		Examples: 
			| Name     | ID      |
			| "Reqres" | "14538" |
			
	@Response1Put	
	Scenario Outline: Automating The <Name> With Test Case ID - <ID> 
		Given path 'users/2' 
		And request { "name" :"Mahesh", "job" : "Software"} 
		When method PUT 
		Then status 200 
		And print response
		And match $ == output[2]
		
		Examples: 
			| Name     | ID      |
			| "Reqres" | "14538" |