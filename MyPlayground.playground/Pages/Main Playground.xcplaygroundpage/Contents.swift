//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, world!"

print(str)

let swiftTeam = 13
let iOSTeam = 54
let otherTeams = 48
var totalTeam = swiftTeam + iOSTeam + otherTeams

totalTeam += 1

print(totalTeam)

/// let = constant

let myConstant = 42

/// var = variable

var myVariable = 42

/// To specify data type, write :type

let implicitDouble = 70.0

let explicitDouble: Double = 70

let yes: Float = 4

// Include values in strings

let label = "The width is "

let width = 94

let widthLabel = label + String(width)

// Another way to include values in strings

let apples = 3
let oranges = 5

let appleSummary = "I have \(apples) apples."

let fruitSummary = "I have \(apples + oranges) apples."

/// Create arrays and dictionaries with brackets []

var shoppingList = ["catfish","water","tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee":"Mechanic",
]

occupations["Jayne"] = "Public Relations"

///print(shoppingList)

///print(occupations)

// To create an empty array or dictionary, use the initializer syntax
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

shoppingList = []
occupations = [:]

/// cOntrol flow

let individualScores = [75,43,103]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


/// In an if statement the conditional must be a Boolean Expression

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "JOhn Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

/// If optional value is nil, the conditional is false.

/// Optional values ?? - If the optional value is missing, the default value is used instead

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

/// Switches for comparison and optional values

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tastes good in soup.")
}

/// After executing code inside switch case that matched, program exits switch statement.

/// ie. no need to break out and the end of each case's code

/// Use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair.

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)


var n = 2
while n < 100 {
    n = n * 2
}

print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

/// .. for range and upper value, ... to include both values

var total = 0
for i in 0..<4 {
    total += i
}

print(total)

/// Functions and closures

/// func = function. use -> to separate parameter names and types from the function's return type.

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}

greet("Bob", day: "Tuesday")

/// Use a tuple to make a compound value. E.g. To return values from a function. 

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min{
            min = score
        }
        sum += score
    }
    
    return (min,max,sum)
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

func sumOf (numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42,597,12)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

/// Functions are first-class type, meaning that they can return another function as their value

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

/// A function can take another function as one of it's arguments

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number > 10
}
var numbers = [20,19,7,12]
hasAnyMatches(numbers, condition: lessThanTen)

/// Functions are closures, blocks of code that can be called later.

/// Closure:

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sort {$0 > $1 }
print(sortedNumbers)

/// Objects and Classes

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription

/// Access class functions with class.function. Also classes need initializer

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

/// self is used to distinguish the name property from the name argument to the initializer. Every property in the initializer needs a value assigned, either in it's declaration of in the initializer.

/// deinit can deallocate an object to clean it up

/// Subclasses include their superclass after their class name, separated by a colon.

/// Ovverride can override a superclass's implementations.

class Square: NamedShape{
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

/// In addition to simple properties stored in the class, properties can have a getter and a setter

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)





