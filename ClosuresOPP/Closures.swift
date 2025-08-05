import Foundation

//1. 클로저란
class ClosuresExample {
    var number = 10
    lazy var closure: () -> Void = {
        [weak self] in self?.number += 5
    }
    
    func CallClosure(){
        closure()
        print(number)
    }
    
    deinit{
        print ("deinit")
    }
}

//2. 클로저 기본 예제
struct closuresTest{
    
    let greet = {(name: String) -> String in return "Hello, \(name)!"}
    
    func ClouserTest(){
        
        print(greet("Bob"))
    }
    
    func performAction(action: () -> Void) {
        action()
    }
    func performAction(){
        print ("Action performed!")
    }
}

func closuerTest1(){
    closuresTest().ClouserTest( )
    closuresTest().performAction()
    closuresTest().performAction {
        print("Action performed!")
    }
    
}

//3. 클로저 구현하기
// 숫자 배열 [1,2,3,4,5] 를 생성하고, 클로저를 사용해 배열의 모든 값을 2배로 만든 결과를 출력하기

struct multiplyNumber{
    var numbers: [Int] = [1,2,3,4,5]
    
    func multiplyByTwo(){
        let result = numbers.map { $0 * 2 }
        print(result)
    }
}

//클로저가 외부 변수 값을 캡처하는 동작을 확인하기

class captureVariable{
    
    
    func runCaptureTest() {
        var counter = 0
        print("초기 counter 값: \(counter)")
        
        let incrementCounter = {
            counter += 1
            print("   -> 클로저 실행! counter가 \(counter)로 변경됨")
        }
        
        print("클로저가 생성되었습니다.")
        
        print("첫 번째 incrementCounter() 호출")
        incrementCounter()
        
        print("두 번째 incrementCounter() 호출")
        incrementCounter()
        
        print("최종 counter 값: \(counter)")

    }
}

