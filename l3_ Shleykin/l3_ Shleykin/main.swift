//
//  main.swift
//  l3_ Shleykin
//
//  Created by Ivan Shleykin on 05/02/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import Foundation


//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


// добавим перечисления для использования в структурах
enum VehileColor {
    case white , black , red , yellow , green
}

enum VehileTransmission {
    case manual , auto , robot , truckmanual
}

enum VehileFuel {
    case benzin , diesel , electricity , hybryd
}



// добавим перечисление с типом транспортного средсва и в зависимости от типа два вложенных перечисления с маркой
enum VehileType {
    enum CarBrand {
        case Mazda , Mercedes , Honda , anotherCar
    }
    
    enum TruckBrand {
        case KRAZ , MAZ , KAMAZ , anotherTruck
    }
    
    case car (brand : CarBrand)
    case truck (brand : TruckBrand)
}

// перечисление с погодой
enum Weather : String {
    case rain = " Дождь "
    case sunny = " Солнечно "
}


enum WindowCloseOpen {
    case open , close
}
// перечисление с действием относительно груза , добавить или убавить
enum AddRemoveLoad {
    case AddLoad
    case RemoveLoad
}
// процент загрузки кузова или багажника
enum PercentOfLoad: Double {
    case empty = 0
    case ten = 0.1
    case twenty = 0.2
    case thirty = 0.3
    case forty = 0.4
    case fifty = 0.5
    case sixty = 0.6
    case seventy = 0.7
    case eighty = 0.8
    case ninty = 0.9
    case full = 1
}

// структура

    struct Vehile {
        var type : VehileType
        let color : VehileColor
        let transmission : VehileTransmission
        let fuel : VehileFuel
        var yearofmanufacture : Int
        var windowopenclose : WindowCloseOpen
        var engine : Bool {
            willSet {
                print("Сейчас двигатель изменит свое состояние, было ->  ", self.engine)
            }
            didSet {
                print("Двигатель , стало ->  ", self.engine)
            }
        }
        var Maxtrunktonnage : Double
        var loadoftrunk : PercentOfLoad
        // вычисляемое свойство , считает текущую загрузку
        var currenttrunk : Double {
            get {
            return Maxtrunktonnage * loadoftrunk.rawValue
            }
           
            
            
        }
        
  
        
 //добавим метод  WeatherWindow для отрытия/закрытия окна в зависимости от погоды
    
        mutating func WeatherWindow (whatweather : Weather) {
        switch whatweather {
        case .rain:
            self.windowopenclose = .close
            print("На улице \(Weather.rain.rawValue) , закроем окна ->window is \(self.windowopenclose)")
        case .sunny:
            self.windowopenclose = .open
            print("На улице \(Weather.sunny.rawValue), откроем окна ->window is \(self.windowopenclose)")
        }
    }
     
        mutating func Engine() {
            engine = !engine
        }
    // метод меняет загрузку
        mutating func ChangeLoad(load : Double, addorremove : AddRemoveLoad) {
            if addorremove == .AddLoad {
                
                if (load + self.currenttrunk) <= self.Maxtrunktonnage {
                    
                    //!!! Вот здесь будет вылетать ошибка , если при делении будет получаться число с более чем 1 цифрой после запятой , как отбросить 2 число пока не понял
                    self.loadoftrunk = PercentOfLoad(rawValue:  ((load + self.currenttrunk)/self.Maxtrunktonnage)  )!
                    print("Добавлено \(load) теперь загрузка \(self.currenttrunk)")
                } else {
                
                    print("Нельзя добавить \(load) максимальная нагрузка \(self.Maxtrunktonnage)   уже  нагружено \(self.currenttrunk)")
                }
            
            } else {
                
                if (self.currenttrunk - load) >= 0 {
                    self.loadoftrunk = PercentOfLoad(rawValue: ((self.currenttrunk - load)/self.Maxtrunktonnage))!
                    print("Убавили \(load) теперь загрузка \(self.currenttrunk)")
                } else {
                    
                    print("Нельзя убавить  \(load) текущая загрузка \(self.currenttrunk)")
                }

                
            }
            
            
           }
        

        
        
}



    



//инициализируем структуру Vehile

var myVehileCar = Vehile(type: .car(brand: .Mazda), color: .white, transmission: .auto, fuel: .benzin, yearofmanufacture: 2010, windowopenclose: .close, engine: true, Maxtrunktonnage: 100, loadoftrunk: .fifty)

var myVehileTruck = Vehile(type: .truck(brand: .MAZ), color: .red, transmission: .truckmanual, fuel: .diesel, yearofmanufacture: 1980, windowopenclose: .open, engine: false, Maxtrunktonnage: 200, loadoftrunk: .fifty)

print(myVehileCar.Engine())


print(myVehileCar.windowopenclose)

myVehileCar.WeatherWindow(whatweather: .sunny )


print(myVehileCar.currenttrunk)


myVehileCar.loadoftrunk = .eighty

print(myVehileCar.currenttrunk)

myVehileTruck.ChangeLoad(load: 80, addorremove: .AddLoad)
print(myVehileTruck.loadoftrunk)

myVehileTruck.ChangeLoad(load: 180, addorremove: .RemoveLoad)
print(myVehileTruck.loadoftrunk)
