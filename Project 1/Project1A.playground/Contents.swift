/*:
# Sums of Powers (1.3)
### Pseudo-code
m and n, we need to return 1-m added together with each m^n
1) We will do this in a closure due to the prompt for the project
2) We will also need a variable that will be added together to keep track of the results.
3) We need to loop through something m number of times
4) The loop will add each expression to the final results.
5) Return the results.
 
In this portion, I decided to use a closure instead of a function. This is was to get practice with closures, especially with the syntax, and because it was required in the project prompt. This closure is named sumOfPowers, which is the exercise's name, and it takes in two integers and returns an integer.
 
 ### sumOfPowers Parameters and Returns:
 * **m**: m is an integer value that will represent then max value (1-m) we will be adding raised to the nth power.
 * **n**: n is an integer value that will represent the power we are raising 0-m to.
 * **return**: sumOfPowers will return an integer after calculations.
 * Example: n = 2 and m = 5 ---> 1^2 + 2^2 + 3^2 + 4^2 + 5^2
 
 ### sumOfPowers Variables
 * **results**: a variable to store the results after each expression is calculated. This variable will be returned.
 * **powerResults**: Since Swift does not have a ** expression, this value will hold the intermediate value for each m, as it calculates the power of each m. This value is then added to **results** before it is reset and calculates the next m^n value.
 * **i**: A loop variable that will represent the current state of m that we are on in the 1-m loop.
 * **j**: A loop variable that will represent the current state of n, when we are calculating the m^n without the ** or pow().
 
 ### Logic:
 Since we will need to loop through integer values 1-m, we first created a loop with the variable **i** that will simply keep track of where we are in m, so we can calculate 1-**m**. With no ** operator and not wanting to use pow(), we created another loop with the variable **j** that will simulate the pow() function multiplying **m** together **n** amount of times to represent **m^n**. This result is then stored in **powerResults** until that state of **m** is completed. Once that state of **m** is calculated, we will add the value from **powerResults** to **results** and move onto the next state of **m**. Once **i = m** the loops will all complete and **results** will be returned, completing the Sums of Powers exercise.
*/

let sumOfPowers: (Int, Int) -> Int = {(n: Int, m: Int) -> Int in //closure statement
    
    var results = 0; //can not be a constant
    for i in 1...m{
        //No ** in Swift, this will multiply (m) to reprsent the power (n)
        var powerResults = 1; //stores the total of the power simulation
        for j in 1...n{
            powerResults*=i
        }
        results+=powerResults
    }
    return results
}


//: VARIABLE INPUTS
var mInput: Int = 5
var nInput: Int = 2


print(sumOfPowers(nInput, mInput))

