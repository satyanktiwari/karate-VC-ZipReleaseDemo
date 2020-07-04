Feature: integration test for the mock
    for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

Background:
    * def port = karate.env == 'mock' ? karate.start('cats-mock.feature').port : 8080
    * url 'http://localhost:' + port + '/cats'

    Scenario: create cat
    Given path 'f58a2704-0bed-4c53-93de-7638d6ab0e71'
    When method get
    Then status 200
    And match response contains { name: 'Billie' }

    * print "\n --------------------------------------------------------------------"
    # Given def cat = <cat><name>Billie</name><scores><score>2</score><score>5</score></scores></cat>
    # sadly, xpath list indexes start from 1
    # Then match cat/cat/scores/score[2] == '5'
    # but karate allows you to traverse xml like json !!
    Then match response.name[1] == 'Billie'