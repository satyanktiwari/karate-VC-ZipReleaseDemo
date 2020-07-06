Feature: web-browser automation
    for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

Background:
   * configure driver = { type: 'chrome' }

Scenario: try to login to github
    and then do a google search
  Given driver 'https://google.com'
  And input("input[name=q]", 'karate dsl')
  When submit().click("input[name=btnI]")
  # this may fail depending on which part of the world you are in !
  Then waitForUrl('https://github.com/intuit/karate')
