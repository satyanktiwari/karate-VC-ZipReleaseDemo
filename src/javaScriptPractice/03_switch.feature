Feature:

Scenario: sample for switch statement
* def hello = function(){return 'hello world'}
* def sequentialSizes =
"""
    function(val){
                    var answer="";
                    switch(val){
                        case 1:answer
                        case 2:answer
                        case 3:answer
                            return "Low"
                            break;
                        case 4:answer
                        case 5:answer
                        case 6:answer
                            return "Mid";
                            break;
                        case 7:answer
                        case 8:answer
                        case 9:answer
                            return "High";
                            break;
                    }

                    return answer;
                }
"""
    * print '---------\n', sequentialSizes(1)
    * assert sequentialSizes(1) == "Low"

    Scenario:Swtich case example with default case
    * def defaultCase =
    """
        function(val){
                    var answer="";
                    switch(val){
                        case "a":answer
                            return "apple";
                            break;
                        case "b":answer
                            return "bird";
                            break;
                        case "c":answer
                            return "cat";
                            break;
                        default:answer
                            return "stuff";
                            break;


                    }

                    return answer;
                }
    """
    * print '---------\n', defaultCase("a")
    * assert defaultCase("a") == "apple"
    * assert defaultCase("d") == "stuff"