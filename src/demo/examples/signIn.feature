@ignore
Feature:

Background:
* def locators = read('locators.json')

Scenario: Login to github with locators specified in an json file

# you can create another variable and store the path so the locators become shorter and easier to read and write
* def logIn = locators.githubSignIn
* print logIn.btnk
* driver 'https://github.com/login'
# this is the way suggested in Peters example on twitter
* driver.input(locators.githubSignIn.userID,'foo1')
* driver.input(locators.githubSignIn.password,'bar1')
# this is the shorter form of the locators easier to read and write
* submit().click(logIn.btnk)
* match html(logIn.errorMessage) contains 'Incorrect username or password.'
* delay(2000)

* def search = locators.googleSearch 
  Given driver 'https://google.com'
  And input(search.searchField, 'karate dsl')
  When submit().click(search.btnkLucky)
  # this may fail depending on which part of the world you are in !
  Then waitForUrl('https://github.com/intuit/karate')