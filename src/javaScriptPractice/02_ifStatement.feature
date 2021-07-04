Feature:

Scenario: Greeter single line function provided by Karate
# This was copied from the darate site
* def greeter = function(title, name) { return 'hello ' + title + ' ' + name }
* assert greeter('Mr.', 'Bob') == 'hello Mr. Bob'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

Scenario: My first single line statement
#  per doc RHS should begin with keyword function
# below is an example of single line statement
* def age = function(val) {return 'age of bob is '+ val}
* print '---------\n', age(12)
#  for js assertion use == or === as = is assignment
* assert age(12) == 'age of bob is 12'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

Scenario: My multilne statement to test strict matching
# Below is an example for multiline statement
* def age = 
"""
function(val) {
    if(val===12){
        return 'age of bob is '+ val
    }
        return 'val is not 12'
    }

"""
* print '---------\n', age(12)
* assert age(12) === 'age of bob is 12'


# * def val = 'bar'
# * def testSrict = val == 'bar' ? 'Yes it matches' : 'No does not match'
# * print '---------\n', testSrict('bar')
# * assert testSrict('bar') == 'Yes it matches'