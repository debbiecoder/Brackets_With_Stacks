//
//  main.swift
//  Brackets
//
//  Created by Debbie Mathews on 4/1/24.
//

import Foundation

//var inputBrackets = "{([3*(2+4)]+5}/12"
var inputBrackets = String("")
print("Enter expression", terminator: "")
if let expression = readLine()
{
    inputBrackets = String(expression)
}

var bracketsList = Array(inputBrackets)
let lenBrackets = inputBrackets.count

let openBrackets: [Character] = ["{", "[", "("]
let closedBrackets: [Character] = ["}", "]", ")"]
let openCloseBrackets: [Character: Character] = ["{":"}", "[":"]", "(":")"]
//let allBrackets: [Character] = ["{", "[", "(", ")", "]", "}"]


var stack: [Character] = []
func push(_ element: Character)
{
    stack.append(element)
//    print(stack)
}
func pop() -> Character?
{
    let stackLength = stack.count
    
    if stackLength <= 0
    {
        return nil
    }
    let removed = stack.remove(at: stackLength - 1)
    return removed
}


for i in 0..<lenBrackets
{
    if openBrackets.contains(String(bracketsList[i])) == true || closedBrackets.contains(String(bracketsList[i])) == true
    {
        if openBrackets.contains(String(bracketsList[i])) == true
        {
            push(bracketsList[i])
        }
        else
        {
            if let remove = pop()
            {
                if openCloseBrackets[remove] != bracketsList[i]
                {
                    print("It is not balanced")
                    exit(0)
                }
            }
            else
            {
                print("It is not balanced")
                exit(0)
            }
        }
    }
}
var stackLength = stack.count
if stackLength != 0
{
    print("It is not balanced")
    exit(0)
}
print("It is balanced")
