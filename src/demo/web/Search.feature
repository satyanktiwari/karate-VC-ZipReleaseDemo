Feature: web-browser automation
    for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

Background:
   * configure driver = { type: 'chrome' }

Scenario: Google Search I'm feeling lucky
    and then do a google search
  Given driver 'https://google.com'
  And input("input[name=q]", 'kalimoh training')
  * delay(1000)
  When submit().click("input[name=btnI]")
  * delay(1000)
Then waitForUrl("https://www.youtube.com/channel/UCeSHRfncNFXXtDe9S0TxWfA")


  
Scenario: Google Search 

  Given driver 'https://google.com'
  And input("input[name=q]", 'kalimoh training')
  * delay(1000)
  When submit().click("input[name=btnK]")
  * delay(1000)
  * waitFor("//h3[contains(text(),'Kalimoh - YouTube')]")
  * highlight("//h3[contains(text(),'Kalimoh - YouTube')]")
* screenshot("//h3[contains(text(),'Kalimoh - YouTube')]")
* quit()