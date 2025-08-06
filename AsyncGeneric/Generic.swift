import Foundation

//제네릭(Generic)
// 1. 제네릭:
//코드의 유연성과 재사용성을 높이기 위해, 타입에 의존하지 않는 코드를 작성하는 방법.
//같은 로직을 다양한 타입에서 사용할 수 있도록 함.
// 2. 제네릭 함수
// 하나의 함수로 여러 타입을 처리.
func swapValue<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

func swapValueTest() {
    var intValueA = 10
    var intValueB = 20
    swapValue(&intValueA, &intValueB)
    print("IntA: \(intValueA), IntB: \(intValueB)")
    
    var stringValueA = "Hello"
    var stringValueB = "World"
    swapValue(&stringValueA, &stringValueB)
    print("StringA: \(stringValueA), StringB: \(stringValueB)")
}

// 3. 제네릭 타입
// 구조체, 클래스, 열거형에서 제네릭을 활용 가능.
struct StackGene<T> {
    var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.popLast()
    }
}

func stackGeneTest() {
    var stack = StackGene<Int>()
    stack.push(1)
    stack.push(2)
    if let topElement = stack.pop() {
        print("topElement: \(topElement)")
    }
}
