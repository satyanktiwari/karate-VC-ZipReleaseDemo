Feature: Smart paste test

Scenario: Paste a curl request using karate smart paste2
* url 'https://countries.trevorblades.com/'
* text GetListOFCountriesWithinContinents =
"""
{
    continents{
  name
  countries{
    name
  }
}
 
  
}
"""
* header Content-Type = 'application/json'
* header Accept = 'application/json'
* header DNT = '1'
* request {"query":"#(GetListOFCountriesWithinContinents)"}
* method post
# name of the query can be anything as in this case it is a very long string describing what we are trying to get