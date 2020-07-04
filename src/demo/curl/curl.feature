Feature: Smart paste experiment

Scenario: Paste a curl request using karate smart paste
* url 'https://countries.trevorblades.com/'
* text test =
"""
{ continents{  countries {    name    code    capital   }    }
}
"""
* text witoutCurlyBraces =
"""
query continents{  countries {    name    code    capital   }    }

"""
* header Content-Type = 'application/json'
* header Accept = 'application/json'
* header DNT = '1'
* request {"query":"#(witoutCurlyBraces)"}
* method post

# if query is written within the text variable then we do not need additional curly braces at start and end of text string
# see e.g. test with curly braces
# witoutCurlyBraces uses keyword query so that it will be parsed correctly