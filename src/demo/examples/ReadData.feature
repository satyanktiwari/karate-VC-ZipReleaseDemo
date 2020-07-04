Feature: json and xml file examples

Background:
* def newLine = '\n***********\n'

Scenario: Complex json and xml files

Given def user1 = { name: 'john', age: 21 }
And def lang1 = 'en'
When def session1 = { name: '#(user1.name)', locale: '#(lang1)', sessionUser: '#(user1)'  }
* print newLine, 'user1 as Json',newLine,karate.pretty(session1),newLine


Given def user2 = <user><name>john</name></user>
And def lang2 = 'en'
When def session2 = <session><locale>#(lang2)</locale><sessionUser>#(user2)</sessionUser></session>
* print newLine,'user2 xml',newLine, karate.prettyXml(session2), newLine

Scenario: Concatenation using embeded expressions
* def foo = { bar: '#("hello " + name)' }
* print newLine, foo,newLine

Scenario: table
* table cats
  | name   | age |
  | 'Bob'  | 2   |
  | 'Wild' | 4   |
  | 'Nyan' | 3   |
* print newLine, cats, newLine
* match cats == [{name: 'Bob', age: 2}, {name: 'Wild', age: 4}, {name: 'Nyan', age: 3}]

Scenario: replace one placeholder at a time
* def text = 'hello <foo> world'
* replace text.foo = 'bar'
* match text == 'hello bar world'


Scenario: Replace multiple place holders at once
* def text = 'hello <one> world <two> bye'

* replace text
  | token | value   |
  | one   | 'cruel' |
  | two   | 'good'  |

* match text == 'hello cruel world good bye'

Scenario: Custom placeholder
* def text = 'hello <one> world ${two} ${third}'
# String
* def first = 'cruel'
# Json
* def json = { second: 'good',third:'bye' }
# Table now calls the value of variables first and json
* replace text
    | token  | value       |
    | one    | first       |
    | ${two} | json.second |
    | ${third} | json.third |

* print newLine, text,newLine
* match text == 'hello cruel world good bye'
* def someJson = read('data.json')
* print newLine, someJson.second, newLine

Scenario: type-conv multi-line text1
 # although the value starts with '{' it is not parsed as JSON, and line-feeds are retained
    * text query =
    """
    {
      hero(name: "Luke Skywalker") {
        height
        mass
      }
    }
    """
    * match query == read('query1.txt').replaceAll("\r", "")
#\r is carriage return

Scenario: type-conv multi-line text2
* text query =
    """
      {
abcd
efgh   
      }
    """
    * match query == read('query2.txt').replaceAll("\r", "")

Scenario Outline: multi-line text in a scenario outline
    * text query =
    """
    {
      hero(name: "<name>") {
        height
        mass
      }
    }
    """
    * match query == read('query1.txt').replaceAll("\r", "")

    Examples:
    | name           |
    | Luke Skywalker |
# https://github.com/intuit/karate/blob/master/karate-junit4/src/test/java/com/intuit/karate/junit4/demos/type-conv.feature

Scenario: json to string
    * def jsonVar = { foo: 'bar' }
    * string strVar = jsonVar
    * match strVar == '{"foo":"bar"}'

Scenario: xml with attributes
    * def xmlVar = <root><foo fizz="buzz">bar</foo></root>
    * json jsonVar = xmlVar
    # it ain't pretty but this is how karate converts xml to a map-like object internally for parity with json
    * match jsonVar == { root: { foo: { _ : 'bar', @: { fizz: 'buzz' }}}}
    # which means that json can be used instead of xpath
    * match jsonVar $.root.foo._ == 'bar'
    * match jsonVar $.root.foo.@ == { fizz: 'buzz' }
    * match jsonVar $.root.foo.@.fizz == 'buzz'
    * match jsonVar $..foo.@.fizz == ['buzz']
    * match jsonVar $..@.fizz contains 'buzz'
    * match jsonVar $..foo.@ contains { fizz: 'buzz' }

  Scenario: xml with namespaces # https://www.w3schools.com/xml/xml_namespaces.asp

    * def xmlVar = <ns1:root xmlns:ns1="http://foo.com" xmlns:ns2="http://bar.com"><ns2:foo fizz="buzz" ping="pong">bar</ns2:foo></ns1:root>
    * json jsonVar = xmlVar
    * print newLine, karate.pretty(jsonVar),newLine
    * match jsonVar == 
    """
    { 
      "ns1:root": {
        "@": { "xmlns:ns1": "http://foo.com", "xmlns:ns2": "http://bar.com" },
        "_": { 
          "ns2:foo": { 
            "_": "bar", 
            "@": { "fizz": "buzz", "ping": "pong" } 
          } 
        }     
      }
    }
    """
    * match jsonVar $.ns1:root..ns2:foo.@ == [{ fizz: 'buzz', ping: 'pong' }]
    * match jsonVar $..ns2:foo.@ == [{ fizz: 'buzz', ping: 'pong' }]
    * match jsonVar $..ns2:foo.@ contains { fizz: 'buzz', ping: 'pong' }
    * match jsonVar $..ns2:foo.@ contains only { fizz: 'buzz', ping: 'pong' }
    * match each jsonVar $..ns2:foo.@ contains { ping: 'pong' }

Scenario: Soap 1.1
* url 'http://www.dneonline.com/calculator.asmx'
Given request
"""
  <?xml version="1.0" encoding="utf-8"?>
  <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
      <Add xmlns="http://tempuri.org/">
        <intA>10</intA>
        <intB>20</intB>
      </Add>
    </soap:Body>
  </soap:Envelope>
"""
  When soap action 'http://tempuri.org/Add'
  * print newLine, response
  Then status 200

# check this http://www.dneonline.com/calculator.asmx?WSDL to get info on soap action to be used
  Scenario: Soap 1.2
  * url 'http://www.dneonline.com/calculator.asmx'
  * request
  """
      <?xml version="1.0" encoding="utf-8"?>
      <soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
        <soap12:Body>
          <Add xmlns="http://tempuri.org/">
            <intA>1</intA>
            <intB>2</intB>
          </Add>
        </soap12:Body>
      </soap12:Envelope>
  """
  When soap action 'http://tempuri.org/Add'
  * print newLine, response
  Then status 200

