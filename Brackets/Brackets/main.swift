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
var yesesAndNos: [String] = []

let openBrackets: [Character] = ["{", "[", "("]
let closedBrackets: [Character] = ["}", "]", ")"]
let openCloseBrackets: [Character: Character] = ["{":"}", "[":"]", "(":")"]
let allBrackets: [Character] = ["{", "[", "(", ")", "]", "}"]


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


for i in 0...lenBrackets - 1
{
    if allBrackets.contains(String(bracketsList[i])) == true
    {
        if openBrackets.contains(String(bracketsList[i])) == true
        {
            push(bracketsList[i])
        }
        else
        {
            if let remove = pop()
            {
                if openCloseBrackets[remove] == bracketsList[i]
                {
                    yesesAndNos.append("yes")
                }
                else
                {
                    yesesAndNos.append("no")
                }
            }
            else
            {
                yesesAndNos.append("no")
            }
        }
    }
}
if yesesAndNos.contains("no") == false
{
    print("It is balanced")
}
else
{
    print("It is not balanced")
}
