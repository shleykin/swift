//
//  main.swift
//  l4_Shleykin
//
//  Created by Ivan Shleykin on 10/02/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import Foundation

/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
*/

enum Color {
    case white , black , red , yellow , green
}

enum Transmission : String {
    case manual = "Ручная"
    case auto   = "Автомат"
    case robot  = "Робот"
}

enum Fuel {
    case benzin , diesel , electricity , hybryd
}

enum WindowCloseOpen {
    case open , close
}

enum CarBrand {
    case Mazda , Mercedes , Honda , anotherCar
}

enum SportcarBrand {
    case ferrari , lamborghini , bugatti
}

enum AddRemoveLoadTrunk {
    case AddLoad
    case RemoveLoad
}

class Car {
    var brand : CarBrand
    var color : Color
    var transmission : Transmission
    var fuel : Fuel
    var windowstate : WindowCloseOpen
    
    init (brand : CarBrand , color : Color , transmission : Transmission , fuel : Fuel , windowstate : WindowCloseOpen) {
        self.brand = brand
        self.color = color
        self.transmission = transmission
        self.fuel = fuel
        self.windowstate = windowstate
    }
    
    convenience init() {
        self.init(brand: .anotherCar , color: .white , transmission: .auto , fuel: .benzin , windowstate: . open)
        print("Вызван Вспомогательный инициализатор")
        
    }

    func printSomething() {
        print("Создан автомобиль \(self.brand) цвет \(self.color) трансмиссия \(self.transmission.rawValue)")
        
    }
    
    deinit {
        print("Автомобиль \(self.brand) направлен на утилизацию")
    }
}

class TrunkCar: Car {
    var trunk : Int
    static var maxTrunk = 0
    init(brand: CarBrand, color: Color, transmission: Transmission, fuel: Fuel, windowstate: WindowCloseOpen , trunk : Int) {
        self.trunk = trunk
        super.init(brand: brand, color: color, transmission: transmission, fuel: fuel, windowstate: windowstate)
        
        TrunkCar.maxTrunk = (2 * self.trunk)  //произвольно задана вместительность в 2 раза больше текущей
        
        }
    override func printSomething() {
        super.printSomething()
        print ("Сейчас в багажнике автомобиля \(self.brand) \(self.trunk) ")
    }

    func ChangeTrunk (_ trunk : Int ,_ change : AddRemoveLoadTrunk) {
        if change == .AddLoad {
            if trunk <= (TrunkCar.maxTrunk - self.trunk) {
                self.trunk = self.trunk + trunk
                print("Добавили груза \(trunk)  теперь загрузка \(self.trunk)")
            } else {
                print("Ошибка , максмальная вместимость \(TrunkCar.maxTrunk)")
            }
        } else {
            if trunk <= self.trunk {
                self.trunk = self.trunk - trunk
                print("Убрали груза \(trunk)  теперь загрузка \(self.trunk)")
            } else {
                print("Ошибка , нельяз убрать больше чем есть \(self.trunk)")
            }
            
        }
        
    }
}


class SportCar: Car {
    var speed : Int
    
    
    /* ??? Здесь пытался сделать переопределение  инициализатора , чтобы brand выбирался из перечсиления SportcarBrand, если такое вообще возможно
     
     
     override init(brand: CarBrand, color: Color, transmission: Transmission, fuel: Fuel, windowstate: WindowCloseOpen) {
        //self.speed = speed
         self.brand = SportcarBrand
        super.init(brand: brand, color: color, transmission: transmission, fuel: fuel, windowstate: windowstate)
    }
    
        init(brand: SportcarBrand, color: Color, transmission: Transmission, fuel: Fuel, windowstate: WindowCloseOpen , speed : Int) {
            self.speed = speed
            super.init(brand: brand, color: color, transmission: transmission, fuel: fuel, windowstate: windowstate )*/

       // self.speed = speed
        //super.init(brand: brand, color: color, transmission: transmission, fuel: fuel, windowstate: windowstate)
    
    
    
    
    init(brand: CarBrand, color: Color, transmission: Transmission, fuel: Fuel, windowstate: WindowCloseOpen , speed : Int) {
        self.speed = speed
        super.init(brand: brand, color: color, transmission: transmission, fuel: fuel, windowstate: windowstate)
    }
    override func printSomething() {
        super.printSomething()
        print ("Скорость автомобиля \(self.speed) ")    }
}

var car1: Car? = Car(brand: .Mazda, color: .white, transmission: .auto, fuel: .benzin, windowstate: .open)
car1?.printSomething()

var car2 = SportCar(brand: .Honda, color: .red, transmission: .manual, fuel: .diesel, windowstate: .close, speed: 200)
car2.printSomething()

var car3 = TrunkCar(brand: .anotherCar, color: .yellow, transmission: .auto, fuel: .benzin, windowstate: .open, trunk: 500)
car3.printSomething()

car3.ChangeTrunk(400, .AddLoad)

car3.ChangeTrunk(900, .RemoveLoad)

var car4 = car3
car4.printSomething()
car4.brand = .Mercedes


car4.printSomething()
car3.printSomething()

car4.ChangeTrunk(950, .AddLoad)
car3.ChangeTrunk(50, .AddLoad)


var car5 = Car()
print(car5.printSomething())

car1 = nil
