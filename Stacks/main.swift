//
//  main.swift
//  Stacks
//
//  Created by Debbie Mathews on 3/6/24.
//

var stack = [1, 3, 5]
func push(_ element: Int)
{
    stack.append(element)
    print(stack)
}
func pop() -> Int?
{
    let stackLength = stack.count
    
    if stackLength <= 0
    {
        return nil
    }
    let removed = stack.remove(at: stackLength - 1)
    return removed
}

push(7)
for _ in 0...5
{
    if let result = pop()
    {
        print(result)
    }
    else
    {
        print("Stack is empty")
    }
}
push(0)
push(5)
push(3)
