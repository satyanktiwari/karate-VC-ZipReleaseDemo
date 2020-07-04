Feature: Avinash # https://stackoverflow.com/questions/60434512/how-to-construct-pojo-like-for-complex-request-structure-using-karate

Background:
* def main = read('main.json')
* def newLine = '\n***********\n'

Scenario: one
* def payload = karate.filterKeys(main, 'addresses')
* print payload

Scenario Outline: two
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

Examples:
# |read('avinash.csv')|
|line1|
|'this is add 1'|

Scenario Outline: TestCase#1
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
* print address
* def myCase = {line1:'#(address.line1)'}
* print myCase
* def line1Only = {addresses:['#(myCase)']}
* print newLine, line1Only,newLine

Examples:
|line1|
|'this is add 1'|

Scenario Outline: TestCase#1 Variation - this solution works
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
* def line1Only = {addresses:['#(myCase)']}
* print newLine, line1Only,newLine

Examples:
|line1|line2!|
|'this is add 1'|''|
|'this is add 2'|'line2 add'|

Scenario Outline: TestCase#1 Variation - with json in external file
Given def address = read('add.json')
# * print address
* def myCase = {line1:'#(address.line1)',line2:'#(address.line2)'}
# * print myCase
* def line1n2 = {addresses:['#(myCase)']}
* print newLine, line1n2,newLine

Examples:
|line1!|line2!|
|'this is add 1'|''|
|'this is add 2'|'line2 add'|