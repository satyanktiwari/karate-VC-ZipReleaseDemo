@ignore
Feature: stateful mock server
    for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

# karate -p 8180 -m src/demo/mock/employees-mock.feature
Background:
* configure cors = true
* def uuid = function(){ return java.util.UUID.randomUUID() + '' }
* def employees = {}

Scenario: pathMatches('/employees') && methodIs('post')
    * def employee = request
    * def id = uuid()
    * employee.id = id
    * employees[id] = employee
    * def response = employee

Scenario: pathMatches('/employees')
    * def response = $employees.*

Scenario: pathMatches('/employees/{id}')
    * def response = employees[pathParams.id]

Scenario: pathMatches('/hardcoded')
    * def response = { Status: 'success' }

Scenario:
    # catch-all
    * def responseStatus = 404
    * def responseHeaders = { 'Content-Type': 'text/html; charset=utf-8' }
    * def response = <html><body>Not Found</body></html>
