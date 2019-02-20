//
//  main.swift
//  l7_Shleykin
//
//  Created by Ivan Shleykin on 19/02/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import Foundation

/*
 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
 
 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
 */
enum WashNames : String {
    case nano    = "НАНОМОЙКА"
    case complex = "КОМПЛЕКСНАЯ МОЙКА"
    case kuzov   = "КУЗОВНАЯ МОЙКА"
}

enum TypeOfCar  {
    case car
    case truck
    case jeep
}

enum DayOfWeek {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

enum CarWashErrors : Error {
    case carwashClosed
    case onlyCarCarwash
    case onlyTruckCarwash
    case whereisCash(cashNeeded: Int)
    case invalidSelection
    
}
//~~~~~2
struct GetWash {
    
    var typeOfWash : WashNames
    var price : Int
    
}

class CarWash {
    var washes = [
        "НАНОМОЙКА":   GetWash(typeOfWash:  .nano   , price: 1000),
        "КОМПЛЕКСНАЯ": GetWash(typeOfWash:  .complex, price: 1500),
        "КУЗОВНАЯ":    GetWash(typeOfWash:  .kuzov  , price: 500)
    ]
    
    var cash = 1400
    
    func WashAnyCar(whatDay: DayOfWeek ,whatCar: TypeOfCar , whatWash wash: String) -> (String?, CarWashErrors?) {
        guard let item = washes[wash] else {
            return (nil, CarWashErrors.invalidSelection)
        }
        guard item.price <= cash else {
            return (nil, CarWashErrors.whereisCash(cashNeeded: item.price - cash))
        }
        guard whatDay != .Monday else {
            return(nil, CarWashErrors.carwashClosed)
        }
        guard whatCar != .truck else{
            return(nil,CarWashErrors.onlyCarCarwash)
        }
        return (item.typeOfWash.rawValue, nil)
    }
}
var SomeCar = CarWash()
var car1 = SomeCar.WashAnyCar(whatDay: .Monday, whatCar: .truck, whatWash: "НАНОМОЙКА")
var car2 = SomeCar.WashAnyCar(whatDay: .Sunday, whatCar: .truck, whatWash: "Test")
var car3 = SomeCar.WashAnyCar(whatDay: .Thursday, whatCar: .truck, whatWash: "КУЗОВНАЯ")
var car4 = SomeCar.WashAnyCar(whatDay: .Thursday, whatCar: .car, whatWash: "КУЗОВНАЯ")
var car5 = SomeCar.WashAnyCar(whatDay: .Thursday, whatCar: .car, whatWash: "КОМПЛЕКСНАЯ")

print(car1)
print(car2)
print(car3)
print(car4)
print(car5)


//~~~~~1

enum SomeErrors : Error {
    case veryYoung
    case bigWeight
    case veryOld
    case invalidSelection
    case alcoToNorthNation
    case onlyWomen
}

enum MaleFemale {
    case men , women
}
struct Human {
    var name : String
    var sex : MaleFemale
    var age : Int
    var weight: Int
   
}

class Humans {
    var humans = [
        "Немец": Human(name: "Fritz", sex: .men, age: 34, weight: 98),
        "Русский": Human(name: "Иван", sex: .men, age: 28, weight: 69),
        "Чукча": Human(name: "Выргыргылеле", sex: .men, age: 41, weight: 57),
        "Американка": Human(name: "Helen", sex: .women, age: 31, weight: 49),
        "Украинка": Human(name: "Оксана", sex: .women, age: 18, weight: 51)
    ]
    
    func getAlcohol(humannationality nation: String) throws -> String {
        guard let pal = humans[nation] else {
            throw SomeErrors.invalidSelection
        }
        guard nation != "Чукча" else {
            throw SomeErrors.alcoToNorthNation
        }
        guard pal.age >= 21 else {
            throw SomeErrors.veryYoung
        }
        return pal.name + " может купить алкоголь " //?????Почему то не выводит строку
    }
    
    func topModel(humannationality nation: String) throws -> String {
        guard let girl = humans[nation] else {
            throw SomeErrors.invalidSelection
        }
        guard girl.sex != .men else {
            throw SomeErrors.onlyWomen
        }
        guard girl.age <= 30 else {
            throw SomeErrors.veryOld
        }
        guard girl.weight <= 51 else {
            throw SomeErrors.bigWeight
        }
        return girl.name + " может стать моделью "//?????Почему то не выводит строку
    }
}


var somePal = Humans()

do {
    try somePal.getAlcohol(humannationality: "Чукча")

} catch SomeErrors.invalidSelection {
    print("Повторите попытку")
} catch SomeErrors.alcoToNorthNation {
    print("Не продавайте алкоголь северным народностям")
} catch SomeErrors.veryYoung {
    print("Запрещено продавать алкоголь лицам младше 21")
}

var someWomen = Humans()

do {
    try someWomen.topModel(humannationality: "Американка")
    
} catch SomeErrors.invalidSelection {
    print("Повторите попытку")
} catch SomeErrors.onlyWomen {
    print("Данная вакансия для женщин")
} catch SomeErrors.veryOld {
    print("Вы страше максимального возраста")
} catch SomeErrors.bigWeight {
    print("Вам надо похудеть ")
}


do {
    try somePal.getAlcohol(humannationality: "Немец")
    
} catch SomeErrors.invalidSelection {
    print("Повторите попытку")
} catch SomeErrors.alcoToNorthNation {
    print("Не продавайте алкоголь северным народностям")
} catch SomeErrors.veryYoung {
    print("Запрещено продавать алкоголь лицам младше 21")
}


//~~~~~~~~~~~~~~~~`
enum FigureError : Error {
    case Error
}
protocol Figure {
    func calculatePerimeter() throws -> Double
}
class Rectangle: Figure {
    var sideA: Double
    var sideB: Double
    func calculatePerimeter() throws -> Double {
        guard sideA > 0.0 && sideB > 0.0  else {
            throw FigureError.Error
        }
        return 2.0 * (sideA + sideB)
    }
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}

var someFigure = Rectangle(sideA: 4.2, sideB: 0.0)

do {
    try someFigure.calculatePerimeter()
} catch FigureError.Error {
    print("Сторона прямоугольника не может быть меньше либо равной 0")
}

extension Rectangle : CustomStringConvertible {
    var description: String{
        return "Периметр: \(2.0 * (sideA + sideB))"
    }
}

print(someFigure.description)
