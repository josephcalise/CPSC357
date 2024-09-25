/*:
# Rock, Paper, Scissors
### Pseudo-code
We are going to need classes for this project, a comparison tool, and an enum to define proper inputs.
 1) Create a Player class, this class will have a property (selection) that is an enum.
 2) Create a setter function for the selection property that will check for valid inputs.
 3) Create a comparison function in the player class that will intake the Computer's selection and check who wins.
 4) Create a Computer class that will inherit the properties
 5) Create a Computer function to roll for a selection (1-3)
 6) Initialize the Computer selection.
 7) Initalize a Computer and Player variable.
 8) Set the player selection and hit play.
 9) If player selection is none, don't compare, if filled compare to computer.
 10) Print the winner.
 
 
In this solution, I chose to make a player class. This class will have a property of selection, which will be the player's selection for the rock, papers, scissors game. This players class will also have a playerSelection function that will act as a setter function for our selection property. This function will intake a string that is either rock, paper, scissors within a switch statement. If the user does not input the correct terms, it will not continue the game. The player class will also house a compare function that will intake the enum RockPaperScissors. This function will compare the player's choice versus the computer's choice and announce a winner. We will then create a Computer class that is inherited from the player class. It will share the selection property, but the setter will differ and will be called computerSelection. This will roll a random number between 1-3, and will make its selection accordingly. Once we we initialize a plater class and a computer class, we will get an input for the user in the playerInput variable, that will be passed into the playerSelection function setting the player's choice. These will then be compared with the computer's choice and announce the winner.
 
 ### RockPaperScissors enum:
 * Limits player choice to rock, paper, or scissor, and none.
 * none is to have a placeholder for an incorrect input for the player.
 
 ### Player Class:
 * has a selection property set to a RockPaperScissors enum that will keep the players choice.
 * playerSelection function that will set the selection property to the player's choice.
 * compareComputer function that will take the computer's choice and compare it to the player's choice and announces the winner.
 
 ### Computer Class:
 * Inherited from the player class with all the same properties.
 * Has a computerSelection function that will roll a random number a set it to a RockPaperScissors choice for the computer.
 
 ### Game:
 * The player will write their choice into the playerInput variable.
 * Run the program
 * After a player and computer are initialized, the computer will call the computerSelection function selecting its choice from RockPaperScissors.
 * If the player's choice doesnt equal none (default value) it will run a compare on the computer's choice and announce the winner.

 
 ### Logic:
 After classes and choice are initialized, the compare funciton will run simply checking both choices. There is a defined set of cases that the selections can be and who the winner will be. We have the top level condition be a tie, and that is when both the player.selection == computer.selection. The rest will announce the winner according to the selection RockPaperScissors enum. There is a conditional checking whether the player has a choice, this is a catch for if the player writes something other the rock, paper, or scissors. This will lead to an invalid choice and the game will not continue.
*/

enum RockPaperScissors { //Used for computer and player selection.
    case rock, paper, scissors, none;
}

class Player {
    var selection: RockPaperScissors = .none; //default selection
    
    func playerSelection(selection: String){ //checks the user selection for a proper selection
        switch selection.lowercased() { //switch to catch no enum selection
        case "rock":
            self.selection = .rock
            print("Player chose \(self.selection)")
        case "paper":
            self.selection = .paper
            print("Player chose \(self.selection)")
        case "scissors":
            self.selection = .scissors
            print("Player chose \(self.selection)")
        default:
            print("Invalid input, please input rock, paper, or scissors") //Not valid input
        }
    }
    
    func compareComputer(computerSelection: RockPaperScissors){
        if computerSelection == self.selection{ //if the selections are equal its a tie.
            print("It's a tie!")
            //logic below for different outcomes
        }else if computerSelection == .rock && self.selection == .paper{
            print("You win!")
        }else if computerSelection == .rock && self.selection == .scissors{
            print("Computer wins!")
        }else if computerSelection == .paper && self.selection == .rock{
            print("Computer wins!")
        }else if computerSelection == .paper && self.selection == .scissors{
            print("You win!")
        }else if computerSelection == .scissors && self.selection == .rock{
            print("You win!")
        }else if computerSelection == .scissors && self.selection == .paper{
            print("Computer wins!")
        }else{
            print("The player did not make a valid selection!")
        }
    }
}

class Computer: Player {
    //computer selection function
    func computerSelection(){
        let roll = Int.random(in: 1..<4) //random number to make a computer selection
        //switch statement to make the computer selection
        switch roll {
        case 1:
            self.selection = .rock
        case 2:
            self.selection = .paper
        case 3:
            self.selection = .scissors
        default:
            self.selection = .rock
        }
        print("The computer chose \(self.selection)")
    }
}

//initialize a player and computer
var computer = Computer()
var player = Player()


//: VARIABLE INPUT HERE
var playerInput: String = "scissors" //get a player choice

player.playerSelection(selection: playerInput); //set the players choice into the selection property

if player.selection != .none{ //if the player did not make a proper selection the program will not run the compare.
    computer.computerSelection(); //computer selects
    player.compareComputer(computerSelection: computer.selection); //compare the selections and announce the winner
}




