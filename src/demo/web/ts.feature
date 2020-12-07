Feature: web-browser automation
    for help, see: https://github.com/intuit/karate/wiki/ZIP-Release

Background:
   * configure driver = { type: 'chrome' }

Scenario: try to login to github
    and then do a google search

  Given driver 'https://username@domain.com:password@url'
  * waitFor("//span[contains(text(),'Welcome Satyank Tiwari')]")
  * screenshot('#tr865')
  * click('#tr865')
  * delay(10000)
  * waitFor("//select[@id='LeaveType']")
  * screenshot("//select[@id='LeaveType']")
  * click("//select[@id='LeaveType']")
  * mouse().move('#LeaveType').click()
  * delay(1000 )
  * screenshot()

#https://username@domain.com:password@url