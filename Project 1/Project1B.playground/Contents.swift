/*:
# Did I pair my parenthesis correctly? (1.2)
### Pseudo-code
We need to write a function that will intake a string, and check if the parentheses are correctly balanced.
 1) This is a classic programming problem that will need a stack to operate.
 2) We need to create a function with a empty stack of Characters.
 3) We will parse through the string and at each character check if that character is a '('
 * If the character is '(', we will push that onto the stack.
 * If the character is ')' we will take away one of the '(' on the stack.
 * If the character is anything well, we will continue.
 4) After parsing the string, if the stack is empty, the parentheses are balanced.
 5) If we ever run into a ')' and the stack is empty, the parentheses are NOT balanced.
 
In this solution, I chose to create a function that takes in a String input that will be the representation of the parentheses and will return a Bool value dependant if the input is balanced parentheses wise. Once called the checkValidParenthesis function will initialize an empty Character array named stack. This stack will be used like a traditional computing stack and add to the top and pop off the top. When the function encounters any '**(**' it will add that character to the stack, and when it encounters any '**)**' it will pop off the stack. It is important to note, if the function encounters any '**)**' and the stack is empty, this will automatically be a fail. After the function parses the string, if the stack is empty, that means there were a balanced amount of parentheses and will return true.
 
 ### checkValidParenthesis Parameters and Returns:
 * **input**: a string representation of an equation or program input with parenthesis
 
 ### checkValidParenthesis Variables
 * **stack**: an array that will push '**)**' characters to keep track of the balancing of parentheses.
 
 ### Logic:
 Since this is a common stack programming paradym, the logic is solely dependant on building and implementing a stack. The key features of a stack is everything is added and taken off from the top, resembeling a stack of papers on a desk. In order to use a stack for what we need, we simply add any opening parentheses '**(**' to our stack, and whenever we see a closing parentheses we will attempt to pop something off the stack. I emphasize attempt because there is an important situation where we encounter a closing parentheses '**)**' and there is nothing in the stack. That means we automatically have unbalanced parentheses and we will return false. Once the string is parsed, we will simply check if the stack is empty or not, if it is, we will return true because there were the correct ammount of opening parentheses and closing parentheses, if the stack has anything in it, that means we are missing some closing parentheses, meaning we will return false.
*/

func checkValidParenthesis(input: String) -> Bool{
    var stack = [Character]() //this is our stack
    for char in input{ //loop through each character in the string
        if char == "("{ //if we see ( we push to the stack
            stack.append(char)
        }else if char == ")"{ //if we see ), check the stack isnt empty and pop a (
            if stack.count == 0{ //if its empty and we have a ) its unbalanced
                return false;
            }
            stack.removeFirst();
        }
    }
    if stack.count == 0{ //balanced only if stack is empty
        return true
    }
    return false
}

//: VARIABLE INPUTS
 var parenthesesInput: String = "()()()"

print(checkValidParenthesis(input: parenthesesInput))

