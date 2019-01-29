//
//  main.swift
//  l1_Shleykin
//
//  Created by Ivan Shleykin on 29/01/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//

import Foundation


//1. РЕШИТЬ КВАДРАТНОЕ УРАВНЕНИЕ.


//ax²+bx+c=0, x=(-b±√D)/2a, D=b²-4ac

let a = 5.0
let b = 8.0
let c = 12.0

var x1: Double
var x2: Double
var d: Double

print("Дано квадратное уравнение  ",a,"x²+",b,"x+",c,"=0")

//вычислим Дискриминант
d = pow(b,2) - (4*a*c)

print("Дискриминант = ",d)

//Если D < 0, корней нет;
//Если D = 0, есть ровно один корень;
//Если D > 0, корней будет два.

if d<0 {
    print("Корней нет")

}
if d>0 {
    x1 = (-b+sqrt(d))/2*a
    x2 = (-b-sqrt(d))/2*a
    print("Дискриминант > 0 , два корня")
    print("x1= ",x1)
    print("x2= ",x2)
}
if d == 0  {
    x1 = (-b+sqrt(d))/2*a
    print("Дискриминант = 0 , один корень")
    print("x1= ",x1)
}


//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

//В прямоугольном треугольнике квадрат длины гипотенузы равен сумме квадратов длин катетов.
//То есть, обозначив длину гипотенузы треугольника через c, а длины катетов через a и b:
//Теорема Пифагора.

//S=½bh S=½ab
//P=a+b+c

let a1 = 5.0
let b1 = 3.0

var c1: Double
var s: Double
var p: Double

c1 = sqrt(pow(a1,2)+pow(b1, 2))
print("Найдем гипотенузу прямоугольного треугольника , катет a= ",a1," Катет b= ",b1)
print("Гипотенуза = ",c1)

s = 0.5*a1*b1
print("Площадь данного прямоугольного треугольника= ",s)

p = a1+b1+c1
print("Периметр данного прямоугольного треугольника= ",p)



//3.* Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
print("Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет")

func bank  (Summa: Double , Procent: Double) -> Double {
    return Summa*pow((1+((Procent/100)/12)),60.0)
}
print("Введите сумму вклада")
let num1 = readLine()
print("Введите процент")
let num2 = readLine()

var IntNum1 = Double(num1!)
var IntNum2 = Double(num2!)

let sum = bank( Summa: IntNum1!, Procent: IntNum2!)
print("Сумма вклада на 5 лет составит = ",sum)

