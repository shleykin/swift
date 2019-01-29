import UIKit
//1lesson_ShleykinIvan

//1. Решить квадратное уравнение.
//ax²+bx+c=0, x=(-b±√D)/2a, D=b²-4ac

let a = 6.0
let b = 8.0
let c = 12.0

var x: Double
var d: Double

//вычислим Дискриминант

d = pow(b,2) - (4*a*c)

print(d)
