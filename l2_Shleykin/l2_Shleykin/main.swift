//
//  main.swift
//  l2_Shleykin
//
//  Created by Ivan Shleykin on 01/02/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.

/*
func evenint(number: Int) -> String {
    let result = number % 2 == 0 ? "Четное" : "Нечетное"
    return result
}

print("Введите число и программа определит четное ли оно : ")
let num = readLine()
var IntNum = Int(num!)
print(evenint(number: IntNum!))

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func devide3(number: Int) -> String {

    let result = number % 3 == 0
    
    switch result {
        
    case true:
        print ("Число ",number, "делится на 3 без остатка")
    case false:
        print ("Число ",number, " не делится на 3 без остатка")
    }
    return String(result)
}

print("Введите число и программа определит делится ли оно на 3 без остатка : ")
let num2 = readLine()
var IntNum2 = Int(num2!)
print(devide3(number: IntNum2!))

*/
// создадим две функции для использования в 4 задании
func evenintBool(number: Int) -> Bool {
    let result = number % 2 == 0 ? true : false
    return result
}

func devide3Bool(number: Int) -> Bool {
    let result = number % 3 == 0 ? true : false
    return result
}
 
 
//3. Создать возрастающий массив из 100 чисел.
print("Введите число и программа создаст возрастающий массив из 100 чисел начиная с этого числа  : ")
let num3 = readLine()
var IntNum3 = Int(num3!)

var Array100 = Array (IntNum3!...(IntNum3!+99))
var newArray100 = [Int] ()
print ("Последнее число в массиве : ",Array100[99])

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for i in Array100 {

    if evenintBool(number: i) == true || devide3Bool(number: i) == false
        
   {
    //Array100.remove(at: i  - IntNum3!) // Thread 1: Fatal error: Index out of range ??????
    //print(i)
    newArray100.append(i)
   }
    
}


print(newArray100)

/*
//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
// F[n] = F[n-1] + F[n-2]


func Fibonacci(steps : Int)  {
    var num1 = 0
    var num2 = 1
    var arrayFib: [Int] = [num1 , num2]

    for _ in 0 ..< steps {
        let num = num1 + num2
        num1 = num2
        num2 = num
        arrayFib.append(num)
    }
 print(arrayFib)
   

}
print("Введите число шагов для последовательности Фибоначчи  : ")
let num4 = readLine()
var IntNum4 = Int(num4!)

Fibonacci(steps: IntNum4!)



//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.


//функция определяющая простое ли число
func Eratosfen (n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    if n <= 3 {
        return true
    }
    var i = 2
    while i*i <= n {
        if n % i == 0 {
            return false
        }
        i = i + 1
    }
    return true
}

print("Введите число , с которого начнется определение простое ли оно   : ")
let num5 = readLine()
var IntNum5 = Int(num5!)

var arraySimple = [Int] () // создадим пустой целочисленый массив для дальнейшего заполнения


repeat {

    if Eratosfen(n: IntNum5! ) == true {
    
    arraySimple.append(IntNum5!)
    }
    IntNum5! = IntNum5! + 1
    
} while arraySimple.count < 100

print(arraySimple)
*/
