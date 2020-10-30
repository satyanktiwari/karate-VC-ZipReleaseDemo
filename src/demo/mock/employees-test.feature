Feature: My first attempt at creating a mock using the template provided in zip release
    for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

Background:
    * def port = karate.env == 'mock' ? karate.start('employees-mock.feature').port : 8180
    * url 'http://localhost:' + port + '/employees'

    # Scenario: create employee
    # * print "\n --------------------------------------------------------------------"
    # * request {name: 'JohnY'}
    # * method post
    # * status 200
    # * def id = response.id

    # * path id
    # When method get
    # Then status 200
    #  And match response == { id: '#(id)', name: 'John' }

 Scenario: create employee 2 with address
    * print "\n --------------------------------------------------------------------"
    * request [{name: 'Dev', addressLine1:'address scenario for mock'},{company:'Kalimoh'}]
    * method post
    * status 200
    * def id = response.id
    * path id
    When method get
    Then status 200
     And match response contains { id: '#(id)', name: 'Dev' }


