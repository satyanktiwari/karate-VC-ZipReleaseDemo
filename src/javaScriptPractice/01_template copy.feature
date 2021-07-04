Feature:

Scenario: Sample multiline JS script
* def age = 
"""
function(val) {
    return 'age of bob is '
    + 
    val
    }
"""
    
* print '---------\n', age(12)
#  for js assertion use == or === as = is assignment
* assert age(12) == 'age of bob is 12'