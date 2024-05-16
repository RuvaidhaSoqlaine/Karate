Feature: Validating The API's Using Post Request

  Background: 
    * url 'https://reqres.in/api/'
    * header Accept = 'application/json'
    * def output = read('info.json')
    #Define Request From Background
    * def requestbody =
      """
      {
      "name" : "Aditya",
      "job":"Senior Analyst"
      }
      """

  #-----------------------------------------------------------------
  # Name - M.Srinivas Sasank
  # Test Case No - 175648
  # Country - India
  #-----------------------------------------------------------------
  @Post1
  Scenario Outline: Automating The <Name> With Test Case ID - <ID>
    Given path 'users'
    And request {"name" : "Aditya","job":"Senior Analyst"}
    When method POST
    Then status 201
    And print response

    Examples: 
      | Name     | ID       |
      | "Reqres" | "175648" |

  #-----------------------------------------------------------------
  # Name - M.Srinivas Sasank
  # Test Case No - 175649
  # Country - India
  #-----------------------------------------------------------------
  @ParamsPost
  Scenario Outline: Automating The <Name> With Test Case ID - <ID>
    Given path 'users'
    And request {"name" : "Aditya","job":"Senior Analyst"}
    When method POST
    Then status 201
    And print response
    And match response == {"name":"Aditya","job":"Senior Analyst","id":"#string","createdAt":"#ignore"}

    Examples: 
      | Name     | ID       |
      | "Reqres" | "175648" |

  #-----------------------------------------------------------------
  # Name - M.Srinivas Sasank
  # Test Case No - 175650
  # Country - India
  #-----------------------------------------------------------------
  @Output
  Scenario Outline: Automating The <Name> With Test Case ID - <ID>
    Given path 'users'
    And request {"name" : "Aditya","job":"Senior Analyst"}
    When method POST
    Then status 201
    And print response
    And match response == output[0]

    Examples: 
      | Name     | ID       |
      | "Reqres" | "175648" |

  #-----------------------------------------------------------------
  # Name - M.Srinivas Sasank
  # Test Case No - 175651
  # Country - India
  #-----------------------------------------------------------------
  @Output1
  Scenario Outline: Automating The <Name> With Test Case ID - <ID>
    Given path 'users'
    And request requestbody
    When method POST
    Then status 201
    And print response
    And match response == output[0]

    Examples: 
      | Name     | ID       |
      | "Reqres" | "175648" |

  #-----------------------------------------------------------------
  # Name - M.Srinivas Sasank
  # Test Case No - 175651
  # Country - India
  #-----------------------------------------------------------------
  @Output2
  Scenario Outline: Automating The <Name> With Test Case ID - <ID>
    Given path 'users'
    And request output[1]
    When method POST
    Then status 201
    And print response
    And match response == output[0]

    Examples: 
      | Name     | ID       |
      | "Reqres" | "175648" |