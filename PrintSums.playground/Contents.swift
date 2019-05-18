func printSums(in array: [Int], withSum target: Int) {
    
    if array.count == 0 {
        print("The array is empty.")
        return
    }
    
    //remove duplicates to avoid checking over the same pair of integers twice
    //sorting will ensure the logic in the next part is reliable
    let newArray = Array(Set(array)).sorted()

    var leftPointer = 0
    var rightPointer = newArray.count-1
    
    repeat {
        //if the pointers have found a valid pair, print it then continue
        if newArray[leftPointer] + newArray[rightPointer] == target {
            print("(\(newArray[leftPointer]), \(newArray[rightPointer]))")
            leftPointer = leftPointer + 1
            rightPointer = rightPointer - 1
        }
            
        //if the pointers have found a pair higher than target, have right pointer point to a smaller integer
        else if newArray[leftPointer] + newArray[rightPointer] > target {
            rightPointer = rightPointer - 1
        }
        
        //if the pointers have found a pair lower than target, have left pointer point to a larger integer
        else if newArray[leftPointer] + newArray[rightPointer] < target {
            leftPointer = leftPointer + 1
        }
    } while(leftPointer < rightPointer)
    
    // if target is even, and can be produced by adding two of the same integers in the array, that case will be missed. So now we check for it
    if target % 2 == 0 {
        
        var counter = 0
        var index = 0
        
        repeat {
            
            if array[index] == target/2 {
                counter = counter + 1
            }
            
            index = index + 1
            
        } while (counter < 2 && index < array.count-1)
        
        if counter == 2 {
            print("(\(target/2), \(target/2))")
        }
    }
}

let target = 8
let array: [Int] = [1,2,3,4,4,4,5,6,7,8,9,10, -2]

printSums(in: array, withSum: target)
