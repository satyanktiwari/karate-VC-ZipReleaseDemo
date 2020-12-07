Feature: Avinash # https://stackoverflow.com/questions/60434512/how-to-construct-pojo-like-for-complex-request-structure-using-karate

Background:
* def main = read('main.json')
* def newLine = '\n***********\n'

Scenario: This will print onlythe addresses part
* def payload = karate.filterKeys(main, 'addresses')
* print payload

# use the remove keyword instead of the filter keyword used above
# parametrize line 1 in addresses using the 
Scenario Outline: trying to parametrize using scenario outline
* def payload = main
* remove payload.site
And remove payload.email
* remove payload.names
# * def line1 = <line1>
# * def line2 = <line2>
# * def city = <city>
# * def state = <state>
# * def postalCode=<postalCode>
* print payload
* print 'variable value is', #(payload.addresses.line1)

Examples:
# |read('avinash.csv')|
|line1|
|'this is add 1'|

# Try to define payload inline and then
# parametrizing it with Examples
Scenario Outline: TestCase1 - defining inline to see if it works
Given def address = 
"""
{
    "line1": <line1>,
    "line2": <line2>,
    "city": <city>,
    "state": <state>,
    "postalCode": <postalCode>
}
"""
* print newLine,'address is',address
* def myCase = {line1:'#(address.line1)'}
* print newLine, 'my case is ',myCase
* def line1Only = {addresses:['#(myCase)']}
* print newLine, line1Only,newLine

Examples:
|line1|
|'this is add 1'|

Scenario Outline: TestCase1 Variation #- this solution works
Given def address = 
"""
{
    "line1": <line1>,
    "line2": <line2>,
    "city": <city>,
    "state": <state>,
    "postalCode": <postalCode>

}
"""
# * print address
* def myCase = {line1:'#(address.line1)',line2:'#(address.line2)'}
* print myCase
* def lines = {addresses:['#(myCase)']}
* print newLine, lines,newLine

Examples:
|line1!|line2!|
|'this is add 1'|''|
|'this is add 2'|'line2 add'|

Scenario Outline: TestCase1 Variation - with json in external file
Given def address = read('add.json')
# * print address
* def myCase = {line1:'#(address.line1)',line2:'#(address.line2)'}
# * print myCase
* def line1n2 = {addresses:['#(myCase)']}
* print "line1n2 is ===>",newLine, line1n2,newLine

Examples:
|line1!|line2!|
|'this is add 1'|''|
|'this is add 2'|'line2 add'|

#if a string value within a JSON (or XML) object declaration is enclosed between #( and ) - it will be evaluated as a JavaScript expression
# https://github.com/intuit/karate#scenario-outline-enhancements
# Type Hints: if the Examples column header has a ! appended, each value will be evaluated as a JavaScript data-type (number, boolean, or even in-line JSON) - else it defaults to string.
Scenario Outline: Case 1 # Suggested by Peter
* def payload = karate.filterKeys(main, 'addresses')
* print "payload is ==>", newLine, payload, newLine
Examples:
|line1!|line2!|city!|state!|postalCode!|
|'this is add 1'|''|''|''|''|
|'this is add 2'|'line2 add'|'city1'|state1'|'postalCode1'|

Scenario Outline: Case 2 # Suggested by Peter
* def payload = main
* remove payload.site
* print "payload is ==>", newLine, payload, newLine
Examples:
|line1!|line2!|city!|state!|postalCode!|email!|first|middle|last|suffix|
|'this is add 1'|''|''|''|''|''|''|''|''|''|
|'this is add 2'|'line2 add'|'city1'|state1'|'postalCode1'|'email@email.com'|'fn'|'M'|'ln'|'dr.'|





Scenario Outline: Only Line fields where json only has address fields
Given def address = read('add.json')
* def myCase = {line1:'#(address.line1)',line2:'#(address.line2)',country:'#(address.country)'}
# * print myCase
* def linenCountry = {addresses:['#(myCase)']}
* print newLine, linenCountry,newLine

Examples:
|line1!|line2!|country!|
|'this is add 1'|''|''|
|'this is add 2'|'line2 add'|'ind'|


Scenario Outline: Line with new fields where json only has address fields
Given def address = read('add.json')
* def myNewCase = {line1:'#(address.line1)',line2:'#(address.line2)',country:'#(address.country)'}
* def newAdd = {addresses:['#(myNewCase)']}
* print newLine, newAdd,newLine

Examples:
|line1!|line2!|country!|
|'this is add 1'|''|''|
|'this is add 2'|'line2 add'|'In'|

# using seta keyword and table to add key value pairs
Scenario: set via table
    * def address = { line1: '' }
    * set address
    | path   | value |
    | line1   | 'add line 1'|
    | line2   | 'add line 2'|
    * print newLine, address
    * match address == { line1: 'add line 1', line2: 'add line 2' }

# Since main.json is used it is an array
    Scenario: set via table
    * def address = karate.filterKeys(main, 'addresses')
    # * def newAddress = 
    * set address
    | path   | value |
    | country| 'country'|
    | cont   | 'country'|
    * print newLine, address
    # * match address == { line1: 'add line 1', line2: 'add line 2' }

Scenario:
* print "this is test", <a>

Scenario Outline:
* print "this is test", <a>

# value of a will not be printed as the value is a string 'hi' and we have defined it to be evluated as non string
Examples:
|a!|
|'hi'|

 

