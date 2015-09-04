//: Playground - noun: a place where people can play

class Car {
    var speed = 0
    
    func accelerateBy(factor: Int) -> Int {
        speed += factor
        return speed
    }
}

let car1 = Car()
Car.accelerateBy(car1)
Car.accelerateBy(car1)(10)

let a = Car.accelerateBy(car1)
a(10)
a(20)
a(30)

typealias IntFunction = (Int) -> Int
func accelerationForCar(car: Car) -> IntFunction {
    return Car.accelerateBy(car)
}

let newA = accelerationForCar(car1)
newA(10)

func multiplyBy(a: Int) -> IntFunction {
    func nestedMultiply(b: Int) -> Int {
        return a * b
    }
    
    return nestedMultiply
}

multiplyBy(10)(20)
let multiplyBy5 = multiplyBy(5)
multiplyBy5(4)

func add(a: Int) -> IntFunction {
    return { b in a + b }
}

let add2 = add(2)
add2(4)

func subtract(a: Int)(b: Int) -> Int {
    return b - a
}

let subtract5 = subtract(5)
subtract5(b: 8)

func multiply(a: Int, b: Int, c: Int) -> Int {
    return a * b * c
}

func multiply(a: Int) -> (Int) -> IntFunction {
    func nestedMultiply1(b: Int) -> IntFunction {
        func nestedMultiply2(c: Int) -> Int {
            return a * b * c
        }
        
        return nestedMultiply2
    }
    
    return nestedMultiply1
}

multiply(4, 5, 6)
multiply(4)(5)(6)
