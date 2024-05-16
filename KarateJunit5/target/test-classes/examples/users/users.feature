Feature: Validation Of GET Requests

  Background: 
    * url 'https://reqres.in/api/'
    * header Accept = 'application/json'
    * def values =
      """
              function(arg){
                  const arr1= [];
                  const arr2= [];
                  const arr3= [];
                  const arr4= [];
                  const arr5= [];
                  var i;
                  var j=0
                  for(i=0;i<arg.length;i++){
                                arr1[i]= arg[i].id;
                                arr2[i]= arg[i].email;
                                arr3[i]= arg[i].first_name;
                                arr4[i]= arg[i].last_name;
                                arr5[i]= arg[i].avatar;
                                
                  }
                  return ["ID",arr1,"Email",arr2,"first_name",arr3,"last_name",arr4,"avatar",arr5];
              }
      """

  @Get1
  Scenario Outline: Automating <Name> Using GET Request Of Test Case ID - <ID>
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    And print response
    Then status 200

    Examples: 
      | Name     | ID       |
      | "Reqres" | "172468" |

  @parse
  Scenario Outline: Automating <Name> Using GET Request Of Test Case ID - <ID>
    Given url baseURL+ 'users'
    When method GET
    And print response
    Then status 200
    * def list = response.data
    * def parse = call values list
    And print parse

    Examples: 
      | Name     | ID       |
      | "Reqres" | "172468" |

  @Get2
  Scenario Outline: Automating <Name> Using GET Request Of Test Case ID - <ID>
    Given path 'users?page=2'
    When method GET
    And print response
    Then status 200

    Examples: 
      | Name     | ID       |
      | "Reqres" | "172468" |

  @Get3
  Scenario Outline: Automating URL With Path Params
    Given path 'users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseTime
    And print responseStatus
    And print responseHeaders
    And print responseCookies

    Examples: 
      | ID       |
      | '123456' |

  @Get4
  Scenario Outline: Automating URL With Path Params
    Given path 'users'
    And param page = 2
    When method GET
    And print response
    And print responseTime
    And print responseStatus
    And print responseHeaders
    And print responseCookies
    And match responseStatus == 200
    And assert response.page == 2
    And match response.data[1].id == 8
    And match response.data[1].email == "lindsay.ferguson@reqres.in"
    Then status 200

    Examples: 
      | ID       |
      | '123456' |
