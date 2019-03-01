//
//  main.swift
//  l5_Shleykin
//
//  Created by Ivan Shleykin on 11/02/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import Foundation

/*
1.  Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2.  Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car»: trunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
 */

enum Brand : String {
    case mazda  = "марка авто MAZDA "
    case kia    = "марка авто KIA "
    case lada   = "марка авто LADA "
}

enum EngineState : String {
    case start = "двигатель START "
    case stop  = "двигатель STOP "
}

enum WindowState : String {
    case open  = "window is OPEN "
    case close = "window is CLOSE "
}

enum LightOnOff : String {
    case on  = "light is ON "
    case off = "light if OFF "
}

enum TrunkStatus : String {
    case empty , half , full
}
enum TypeOfWash  : String {
    
    case full    = "КОМПЛЕКС "
    case express = "ЭКСПРЕСС "
}

enum TypeOfTyres : String {
    case allterrain = "ВСЕСЕЗОННЫЕ"
    case mudterrain = "ГРЯЗЕВЫЕ"
    case snowterrain = "ЗИМНИЕ"
}

protocol Car {
    var brand :   Brand       {get}
    var engine:   EngineState {get}
    var window:   WindowState {get}
    var light:    LightOnOff  {get}
    var weight:   Double      {get}
    
    func carInfo() -> String
    
}
//~~~~~Расширение для протокола Car
extension Car {
    
    func washCar(type : TypeOfWash) -> String {
        return brand.rawValue + "ПОМЫТА " + type.rawValue
    }
    func weightTonns() -> Double {
        return  weight/1_000.0
        
    }
    
}

//~~~~~Класс TrunkCar

class TrunkCar : Car {
    
    var brand:  Brand
    var engine: EngineState
    var window: WindowState
    var light:  LightOnOff
    var trunk:  TrunkStatus
    var weight: Double
    
    func carInfo() -> String {
        return brand.rawValue + engine.rawValue + window.rawValue + light.rawValue + "trunk status is " + trunk.rawValue + " Вес авто в кг = \(weight)"
    }
    
    init (brand: Brand, engine: EngineState, window: WindowState,light: LightOnOff, trunk: TrunkStatus, weight : Double) {
        self.brand  = brand
        self.engine = engine
        self.window = window
        self.light  = light
        self.trunk  = trunk
        self.weight = weight
    }
}

//~~~~~Класс SportCar
class SportCar : Car {
    
    var brand:  Brand
    var engine: EngineState
    var window: WindowState
    var light:  LightOnOff
    var weight: Double
    var power:  Int
    var speed:  Int
                                    // для полиморфизма
    var tyres: TyresType?
    func getTyres(whattype : TypeOfTyres) {
        tyres?.aboutTyres(type: whattype)
    }
    
    
    
    func carInfo() -> String {
        return brand.rawValue + engine.rawValue + window.rawValue + light.rawValue + " max speed КМ/Ч \(speed)" + " Мощность Л.С. \(power)" + " Вес авто в кг = \(weight)"
    }
    
    init (brand: Brand, engine: EngineState, window: WindowState,light: LightOnOff, weight : Double, power: Int, speed : Int) {
        self.brand  = brand
        self.engine = engine
        self.window = window
        self.light  = light
        self.weight = weight
        self.speed  = speed
        self.power  = power
    }
}

//~~~~~Расширение для класса TrunkCar
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Машина ГРУЗОВАЯ , ее вес в тоннах \(self.weightTonns())"
    }
    

    
}
//~~~~~Расширение для класса SportCar
extension SportCar {
    func mph() -> Double {
        return Double(speed) * 0.62
    }
    
    func kwt() -> Double {
        return Double(power) * 0.74
    }
}

extension SportCar:CustomStringConvertible {
    var description: String {
        return "Cкорость в MP/H = \(self.mph())mp/h ; мощность в кВт = \(self.kwt())кВт "
    }
    

}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ПОЛИМОРФИЗМ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

protocol TyresType {
    func aboutTyres (type : TypeOfTyres)
}



class BFGoodrich : TyresType {
    
    func aboutTyres (type : TypeOfTyres)  {
        print( "У нашей машины шины BFGoodrich и они \(type.rawValue)" )
    }
}

class Yokohama : TyresType {
    
    func aboutTyres (type : TypeOfTyres)  {
        print( "У нашей машины шины Yokohama и они \(type.rawValue)" )
    }
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Объекты в консоль~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

var trunkcar1 = TrunkCar(brand: .kia, engine: .stop, window: .close, light: .off, trunk: .half, weight: 6950)

var sportcar1 = SportCar(brand: .mazda, engine: .start, window: .open, light: .on, weight: 1670, power: 340, speed: 280)

print(trunkcar1.carInfo())
print(trunkcar1.washCar(type: .express))
print(trunkcar1)

print("\(sportcar1.carInfo())  \(sportcar1.washCar(type: .full))  Вес в тоннах \(sportcar1.weightTonns())  \(sportcar1)")

sportcar1.tyres = BFGoodrich()
sportcar1.getTyres(whattype: .mudterrain)

sportcar1.tyres = Yokohama()
sportcar1.getTyres(whattype: .snowterrain)
