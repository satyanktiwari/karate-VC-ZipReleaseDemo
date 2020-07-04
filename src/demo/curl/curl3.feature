Feature: Smart paste test3

Scenario: copy form the copy Curl button on playground
* url 'https://countries.trevorblades.com/'
* header Content-Type = 'application/json'
* header Accept = 'application/json'
* header DNT = '1'
* request {"query":"query  GetListOFCountriesWithinContinents {continents{  name  countries{    name  }}   }"}
* method post

# when using smart paste find and replace following
# n and /n and replace with blank
# add feature and scenario name




Scenario: from browser f12 - netwerok tab cpy curl bash
* url 'https://countries.trevorblades.com/'
* header authority = 'countries.trevorblades.com'
* header content-type = 'application/json'
* request {"query":"query GetListOFCountriesWithinContinents {  continents {    name    countries {      name    }  }}"}
* method post
# when using smart paste find and replace following
# n and /n and replace with blank
# add feature and scenario name
#remove the additional headers
#remove the additional parameters added in the request to get the query part only
