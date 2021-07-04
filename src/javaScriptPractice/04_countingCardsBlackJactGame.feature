Feature:

Scenario: Sample multiline JS script
* def countingCards = 
"""
var count = 0;

                function(card) {
                // Only change code below this line
                    switch(card){
                        case 2:
                        case 3:arguments
                        case 4:arguments
                        case 5:arguments
                        case 6:arguments
                            count +=1;
                            break;
                        case 7:arguments
                        case 8:arguments
                        case 9:arguments
                            count +=0;
                            break;
                        case 10:arguments
                        case "J":arguments
                        case "Q":arguments
                        case "K":arguments
                        case "A":arguments
                            count -=1;
                            break; 
                        default:arguments
                            return "invalid argument";
                            break;
                    }
                    if(count > 0){
                                return count + " Bet"
                            } else if (count < 0){
                                return count + " Hold"
                            } else {
                                return "inalid argument"
                            }           
                }
"""
#  printing count here will give the initial count which is zero
* print '---------\n count is ------', count 

* print '---------\n', countingCards(2)

#  printing count here will give the current count
* print '---------\n count is ------', count  

#  for js assertion use == or === as = is assignment
* match countingCards(2) == count +' Bet'