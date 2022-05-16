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
    var lastAnswer : Int = 0
    func getOneTask( tuple: (minArgValue: Int,
                             maxArgValue: Int,
                             minAnswerValue: Int,
                             maxAnswerValue: Int,
                             plus: Bool,
                             minus: Bool,
                             step: Int)) -> [String] {
        
        // переменная для возвращаемого значения
        var oneTask = [String]()
        
        // эта функция возваращает массив строк с вариантами ответов
        func getAnswerVariantArray(range: ClosedRange<Int>, answerValue: Int) -> [String] {
//      func getAnswerVariantArray(minArgValue: Int, maxAnswerValue: Int, answerValue: Int) -> [String] {
            var answerVariantArray = [String]()
            var rnd = String(Int.random(in: range))
            answerVariantArray.append(rnd)
            
            // добавляем 5 значений в массив ответов
            for _ in 0..<5 {
                
                // чтобы варианты ответов не повторялись при каждом добавлении значения
                // проверяем не содержит ли массив уже это значение
                repeat {
                    rnd = String(Int.random(in: range))
                }
                while answerVariantArray.contains(rnd)
                        
                        answerVariantArray.append(rnd)
            }
            
            // затем проверяем содержит ли массив ответов правильной ответ и если нет то добаляем его
            if !answerVariantArray.contains(String(answerValue)){
                answerVariantArray[0] = String(answerValue)
            }
            return answerVariantArray
        }
        
        // что бы в тасках следующих друг за другом ответы не повторялись введем переменную lastAnswer
        // генерим answerValue и firstValue и сравниваем answerValue с lastAnswer если равны то генерим еще раз
        let firstValue = Int.random(in: tuple.minArgValue...tuple.maxArgValue)
        var answerValue = Int()
        repeat {
            answerValue = Int.random(in: tuple.minAnswerValue...tuple.maxAnswerValue)
        } while answerValue == lastAnswer
        
        // затем обновляем значение lastAnswer
        lastAnswer = answerValue
        
        // если сгенерился answerValue >= firstValue то создаем таск на сложение
        if  answerValue >= firstValue {
            let secondValue = answerValue - firstValue
            oneTask.append(String(firstValue))
            oneTask.append(String("+"))
            oneTask.append(String(secondValue))
            oneTask.append(String("="))
            oneTask.append(String(answerValue))
            
            oneTask =  oneTask + (getAnswerVariantArray(range: (tuple.minArgValue...tuple.maxAnswerValue), answerValue: answerValue)).shuffled()
        } else {
            
            // если сгенерился answerValue < firstValue то создаем таск на вычитание
            let secondValue =  firstValue - answerValue
            oneTask.append(String(firstValue))
            oneTask.append(String("-"))
            oneTask.append(String(secondValue))
            oneTask.append(String("="))
            oneTask.append(String(answerValue))
            
            oneTask =  oneTask + (getAnswerVariantArray(range: (tuple.minArgValue...tuple.maxAnswerValue), answerValue: answerValue)).shuffled()
        }
        
        return oneTask
        
    }
}

