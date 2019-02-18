//
//  main.swift
//  l6_Shleykin
//
//  Created by Ivan Shleykin on 15/02/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

enum MaleFemale {
    case male , female
}

enum CarBrand {
    case kamaz, maz , toyota , audi
}

enum TypeOfCar {
    case truck , simplecar
}

protocol Weight {
    var weight : Double {get set}
}

protocol Age {
    var age : Double {get set}
}



class Worker : Weight, Age {
    
    let name    : String?
    let sex     : MaleFemale
    
    var weight  : Double
    var age     : Double
    
    init(name: String?, sex: MaleFemale, weight: Double, age: Double) {
        self.name = name
        self.sex = sex
        self.weight = weight
        self.age = age
    }


}


class CompanyCar : Weight, Age {
    
    let brand   : String?
    let type    : TypeOfCar
    
    var weight  : Double
    var age     : Double
    
    init(brand: String?, type: TypeOfCar, weight: Double, age: Double) {
        self.brand = brand
        self.type = type
        self.weight = weight
        self.age = age
    }

    
}
//наша коллекция типа Очередь , поддерживающая протоколы Возраст и Вес
struct Queue<T: Weight> where  T: Age {
    var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
    var averageWeight : Double {   //расчет среднего веса
        var weight = 0.0
        var count = 0.0
        for element in elements {
            weight += element.weight
            count = count + 1.0
        }
        return weight/count
    }
    
    var averageАge : Double {      //расчет среднего возраста
        var age = 0.0
        var count = 0.0
        for element in elements {
            age += element.age
            count = count + 1.0
        }
        return age/count
    }
    

//функция высшего порядка , использующая замыкание
    func pensionAge (queue: [T] , predicate: (Double) -> Bool ) -> [T] {
        var tmpArray: [T] = []
        for element in queue {
            if predicate(element.age) {
                tmpArray.append(element)
                print(element.age)
            }
        }
        return tmpArray
        
    }

/*
     func heavyTruck (queue: [T] , predicate: (Double) -> Bool ) -> [T] {
        var tmpArray: [T] = queue
        for element in tmpArray {
            if predicate(element.weight) {
                tmpArray.remove(at: element )
            }
        }
        return tmpArray
        
    }

*/
    

    subscript(indexes: Int...) -> [T]? {
        var tmpArray: [T] = []
        
        for index in indexes {
            if index < elements.count {
                tmpArray.append(elements[index])
            }
            else {
                return nil
            }
        }
        
        return tmpArray
    }
 
}
// пытался обозначить предпенсионный возраст в зависмомти от пола , но не додумался
let pension: (Double) -> Bool = { (age: Double) -> Bool in
    return (60.0 - age ) <= 5.0 || ( age - 60.0 ) > 0.0
}


let heavytruck: (Double) -> Bool = { (weight: Double) -> Bool in
    return weight > 15000.0
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
var queueWorkers = Queue<Worker>()
var queueCompanyCars = Queue<CompanyCar>()


queueWorkers.push(Worker(name: "Alex", sex: .male, weight: 70.8, age: 32.5))
queueWorkers.push(Worker(name: "Mike", sex: .male, weight: 93.2, age: 56.0))
queueWorkers.push(Worker(name: "Jane", sex: .female, weight: 52.3, age: 62.5))
queueWorkers.push(Worker(name: "Lilu", sex: .female, weight: 60.9, age: 42.5))


queueCompanyCars.push(CompanyCar(brand: "Maz", type: .truck, weight: 8800.5 , age: 8.6))
queueCompanyCars.push(CompanyCar(brand: "Kamaz", type: .truck, weight: 15420.5 , age: 12.3))
queueCompanyCars.push(CompanyCar(brand: "Audi", type: .simplecar , weight: 2110.5 , age: 3.2))
queueCompanyCars.push(CompanyCar(brand: "Toyota" , type: .simplecar, weight: 1920.3 , age: 4.7))

print("Средний возраст авто \(queueCompanyCars.averageАge)")
print("Округлим его \(round(queueCompanyCars.averageАge))")

print("Средний возраст авто \(queueCompanyCars.averageWeight)")

print("Cредний вес работников \(queueWorkers.averageWeight)")
print("Cредний возраст работников \(queueWorkers.averageАge)")





queueWorkers.elements.filter {(worker) -> Bool in
   return worker.weight > 70.0
}


print(queueWorkers.pensionAge(queue: queueWorkers.elements, predicate: pension))

//удаляем первых двух по приницпу очереди
queueWorkers.pop()
queueWorkers.pop()
print("Cредний возраст работников , учитывая сокращение \(queueWorkers.averageАge)")

print(queueCompanyCars[2,3,4])

