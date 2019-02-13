import UIKit

class SuperClass {
    init(x: Int) {
        print("3. SuperClass.init(x: \(x))")
    }
    convenience init() {
        print("1. SuperClass.init()")
        self.init(x: 123) // Will be overridden by subclass.
    }
}

class SubClass: SuperClass {
    override init(x: Int) {
        print("2. SubClass.init(x: \(x))")
        super.init(x: x)
        print("4. SubClass.init(x: \(x))")
    }
}

// Calls inherited convenience initializer.
//let sub = SubClass()


protocol FullyNamed {
    var fullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(_ name: String,_ prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
    
    
}
var ncc1701 = Starship("Enterprise",  "USS")
var ncc1702 = Starship("Missouri")
ncc1701.fullName
ncc1702.fullName


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Выведет "Случайное число: 0.37464991998171"
print("And another one: \(generator.random())")
// Выведет "Другое случайное число: 0.729023776863283"


protocol LetterBelonging{                    // объявляем протокол принадлежности для письма
    func writeText(_ text: String)
}
class Hand{
    var letterBelonging:LetterBelonging?   // объявляем свойство руки держать принадлежность
    func write(_ text: String) {          // говорим руке писать
        letterBelonging?.writeText(text) // и она уже пишет принадлежностью
    }
}
class RedPen: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем красной пастой: \(text)")
    }
}
class BluePen: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем синей пастой: \(text)")
    }
}
class Pencil: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем грифелем: \(text)")
        print("При этом слышим скрип")
    }
}
class Marker: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем фломастером : ~~\(text)~~")
        print("При этом пахнет спиртом")
    }
}
class Pen: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем пером : ~~\(text)~~", "Остаются кляксы")
    }
}
let hand = Hand()
hand.letterBelonging = RedPen()
hand.write("Привет")
hand.letterBelonging = BluePen()
hand.write("Мир")
hand.letterBelonging = Pencil()
hand.write("Я написал")
hand.letterBelonging = Marker()
hand.write("первую программу")
hand.letterBelonging = Pen()
hand.write("с полиморфизмом!")


/*
enum Color {
    case white , black , red , yellow , green
}

enum CarBrand {
    case Mazda , Mercedes , Honda , anotherCar
}

enum SportcarBrand :  {
    case ferrari , lamborghini , bugatti
}

class Car {
    var brand : CarBrand
    var color : Color
    init(brand: CarBrand , color: Color) {
        self.brand = brand
        self.color = color
    }
}

class SportCar : Car {
    var speed : Int
    
    override init(brand: CarBrand , color: Color) { //Вот здесь совсем не понятно
        self.brand = brand
        super.init(brand: brand , color: color)
    }
    init(brand: CarBrand, color: Color, speed : Int) {
        self.speed = speed
        brand = SportcarBrand
        super.init(brand: brand, color: color )
}



} */

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("Один дюйм - это \(oneInch) метра")
// Выведет "Один дюйм- это 0.0254 метра"
let threeFeet = 3.ft
print("Три фута - это \(threeFeet) метра")
// Выведет "Три фута - это 0.914399970739201 метра"
var test = 100.km

