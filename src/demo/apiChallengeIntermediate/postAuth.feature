Feature: authenticated by calling the Auth API and saving the token

Background:
* url 'https://automationintesting.online'

Scenario: Get access token and book a room
* def auth =
"""
    {
  "password": "password",
  "username": "admin"
}
"""
* path 'auth/login'
* request auth
* method POST
* status 200
# * match response contains {token: 'string'}
* print '\n**********token is***************************',response.token
* def authResponse = response
* def storedTokenValue = 'token='+response.token
* print 'storedTokenValue is ===', storedTokenValue

* path 'auth/validate'
* request authResponse
* method POST
* status 200
* print '\n++++++++++', response

Given path 'room/'
* configure headers = { 'Content-Type': 'application/json', Accept: 'application/json', cookie:'#(storedTokenValue)' }

* def createRoom =
"""  
 {
  "rooms": [
    {
      "roomid": 2,
      "roomNumber": 299,
      "type": "single",
      "accessible": true,
      "image": "https://www.mwtestconsultancy.co.uk/img/testim/room2.jpg",
      "description": "Aenean porttitor mauris sit amet lacinia molestie. In posuere accumsan aliquet. Maecenas sit amet nisl massa. Interdum et malesuada fames ac ante.",
      "features": [
        "TV",
        "WiFi",
        "Safe"
      ],
      "roomPrice": 299
    }
  ]
}
"""
* def createRoom2 =
    """
        {
    "roomid": 7,

    "roomNumber": 199,

            "type": "Double",

            "accessible": true,

            "image": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.housebeautiful.com%2Froom-decorating%2Fbedrooms%2Fg648%2Fbeautiful-designer-bedrooms%2F&psig=AOvVaw1iGFx-pUXBnLX39wj7QveN&ust=1603534977935000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIDy-7e_yuwCFQAAAAAdAAAAABAE",

            "description": "A really nice room. 3 stars",

            "features": [

                "TV",

                "WiFi",

                "Safe",

                "Snacks"

            ],

            "roomPrice": 400

        }
    """
* request createRoom2
* method POST
Then status 201

Given path 'auth/logout'
* request authResponse
* method POST
* status 200