import UIKit

// Enumeration Syntax
enum SomeEnumeration {
    // enumeration definition goes here
}

// implementation 1

enum CompassPoint {
    case north
    case south
    case east
    case west
}

// implementation 2

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west

directionToHead = .east

// Matching Enumeration values with a switch statement

directionToHead = .south
switch directionToHead {
case .east:
    print("1")
case .west:
    print("2")
case .north:
    print("3")
case .south:
    print("4")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}


// Iterating over enumeration case

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count

for beverage in Beverage.allCases {
    print(beverage)
}

//-----------------------------------------------------------------------------//

// Associated Values

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode (String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numSystem, let menuSystem, let product, let check):
    print("UPC: \(numSystem), \(menuSystem), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

switch productBarcode {
case let .upc(numSystem, menuSystem, product, check):
    print("UPC: \(numSystem), \(menuSystem), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

//-----------------------------------------------------------------------------//

// Raw Values

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Associated values and raw values are different. Raw values are prepopulated in other side associated values are set when you create new constant or variable.

//-----------------------------------------------------------------------------//

// Implicitly assigned Raw Values

enum ImplicitPlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// 1,2,3,4,5,6...so on

enum ImplicitCompassPoint: String {
    case north = "Me"
    case south
    case east
    case west
}

print(ImplicitPlanet.mercury.rawValue, ImplicitPlanet.jupiter.rawValue)
print(ImplicitCompassPoint.north.rawValue, ImplicitCompassPoint.east.rawValue)

//-----------------------------------------------------------------------------//

// Initializing from a Raw Value

let possiblePlanet = ImplicitPlanet(rawValue: 7)
// returns a optional

let positionToFind = 11
if let somePlanet = ImplicitPlanet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Moslty harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

//-----------------------------------------------------------------------------//

// Recursive Enumerations

// you indicate that an enumeration case is recursive by writing indirect before it.

//enum ArithmeticExpression {
//    case number(Int)
//    indirect case addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// (5+4) * 2

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left)*evaluate(right)
    }
}

print(evaluate(product))


//-----------------------------------------------------------------------------//
