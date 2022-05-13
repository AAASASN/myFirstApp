//
//  TasksModel.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 13.05.2022.
//

import Foundation

class TaskModel {
    
    // это свойство будет возвращать элементы задания вида ["8", "+", "0", "=", "8", "5", "6", "7", "8", "9", "10"]
    var oneTask = [String]()
    
    func getOneTask( tuple: (minArgValue: Int,
                             maxArgValue: Int,
                             minAnswerValue: Int,
                             maxAnswerValue: Int,
                             plus: Bool, minus: Bool,
                             step: Int)) -> [String] {
        var oneTask = [String]()
        
        if tuple.plus {
            
            var answerValue = Int.random(in: tuple.minAnswerValue...tuple.maxAnswerValue)
            var firstValue = Int.random(in: tuple.minArgValue...tuple.maxArgValue)

            while firstValue >= answerValue {
                answerValue = Int.random(in: tuple.minAnswerValue...tuple.maxAnswerValue)
                firstValue = Int.random(in: tuple.minArgValue...tuple.maxArgValue)
            }
            
            let secondValue = answerValue - firstValue

            var answerVariantArray = [String]()
            var rnd = String(Int.random(in: tuple.minArgValue...tuple.maxAnswerValue))
            answerVariantArray.append(rnd)

            for _ in 0..<5 {
                repeat{
                    rnd = String(Int.random(in: tuple.minArgValue...tuple.maxAnswerValue))
                } while answerVariantArray.contains(rnd)
                answerVariantArray.append(rnd)
            }
            
            if !answerVariantArray.contains(String(answerValue)){
                answerVariantArray[0] = String(answerValue)
            }
            
            oneTask.append(String(firstValue))
            oneTask.append(String("+"))
            oneTask.append(String(secondValue))
            oneTask.append(String("="))
            oneTask.append(String(answerValue))
            oneTask =  oneTask + answerVariantArray.shuffled()
        }
        return oneTask
    }
    
}
