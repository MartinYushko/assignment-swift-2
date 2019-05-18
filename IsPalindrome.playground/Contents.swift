func isPalindrom(for str: String) -> Bool {
    let chars = Array(str)
    
    if chars.count == 0 {
        print("The string is empty.")
        return false
    }
    
    for i in 0...chars.count/2 {
        // as soon as asymmetry is detected, return false
        if chars[i] != chars[chars.count-i-1] {
            return false
        }
    }
    
    //if the function has gotten to this point, it means that no assymetry has been detected, so the string is a palindrome
    return true
}


let myString = "hello"
print(isPalindrom(for: myString))
