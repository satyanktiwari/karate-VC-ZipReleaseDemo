Feature: Beginner automation challenge for Test Bash

Background:
* url 'https://automationintesting.online'

Scenario: Perform a GET request on the branding API and assert the response.
Given path 'branding'
When method GET
Then status 200
And print '\n **********' response
And match response contains {name:'Shady Meadows B&B', name:'#string'}
And match response.map contains {latitude:52.6351204,longitude:1.2733774}