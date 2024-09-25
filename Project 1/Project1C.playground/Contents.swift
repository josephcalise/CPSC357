/*:
# Partial Sum (1.2)
### Pseudo-code
We need to write a function that will intake two arrays, one of integers, and one of tuples of index pairs a and b. Once parsed we will need to get the sum of integers between each index pairing between the array1[a] - array2[b].
 1) We will need to intake and interate through the index pairs.
 2) For each result we will need to create another array as the result that will hold the number of results corresponding to the number of index pairs.
 3) We will need to join and return only the results out of the results array, not the whole array.
 
In this solution, I chose to create a function that takes in two arrays, the first being an array of integers, the second being an array of tuples that represent a starting index and ending index (a,b). This function will take the array of tuples and loop through each element in the array. For each element, it will destructure the tuple into two variables begin and end, which will be our indexes we are going to add through on the numbers array. Once we have a begin and end, we will begin looping from begin to end as indexes adding the values in the numbers array. This value will be type casted to a string and stored in a results array for later. We will then continue this process for any number of index pairs we recieve. Once that is complete, we will join the results array into a single string, and return that string as our results.
 
 ### partialSum Parameters and Returns:
 * **numbers**: an array of Integers that will be added together from the starting index to the ending index for each tuple provided.
 * **indexPairs**: an array of tuples with two integer values representing the beginning index to add through the end index, in form (a,b) -> (start, end)
 * **return**: partialSum will return a String of the values that correspond to the results of each index pair's adding.
 
 ### checkValidParenthesis Variables
 * **resultsArr**: an array that will have each results value pushed to it to store for the later return.
 * **begin**: represents the beginning of the current index pair for indexing the numbers array.
 * **end**: represents the ending of the current index pair for inddexing the numbers array.
 
 ### Logic:
 Since our numbers array will remain static and we will simple access indexes in it, we can keep it normal. We will need to loop through an unspecified amount of index pair tuples in the indexPairs array. For this we chose to do loop through 0-indexPairs.count-1, to ensure we get each pair. Once we are at a current indexPair, we will destructure the pairing into two variables begin (a) and end (b). These variables will each be in the next loop where we will use the begin index and loop through numbers until we reach the end index. At each point between we will add those numbers to results. Once we reach end, we will type cast the value into a string and store it in our results array corresponding the same index as the index pairs provided. Once this process is complete for each index pair, we will join the results array as a string separating each value by a "," and return that string as the results.
*/

func partialSum(numbers: [Int], indexPairs: [(Int, Int)]) -> String {
    var  resultsArr = [String]()
    for i in 0...indexPairs.count-1{
        let (begin, end) = indexPairs[i] //destructure a and b
        var results = 0 //variable to hold our adding.
        for j in begin...end{ //loop through just the indexes provided
            results += numbers[j] //add that index's number to results
        }
        resultsArr.append(String(results)) //push to the results array as a String by type casting.
    }
    return "\(resultsArr.joined(separator:","))" //join all values in the array turning it into one string separated by a comma.
}

//: VARIABLE INPUTS
var numbersArray = [3, 6, 4, 15, 30]
var indexPairsArray = [(1,3),(0,4)]



print(partialSum(numbers: numbersArray, indexPairs: indexPairsArray))

