import Foundation

//후입선출(LIFO, Last In First Out) 구조
//데이터를 한쪽에서 삽입하고 제거.
//사용 사례: 함수 호출 스택, 괄호 검사

struct Stack<T> : CustomStringConvertible{
    private var elements: [T] = []
    
    var description: String{
        if elements.isEmpty{
            return "Stack is empty"
        }
        return "---- Stack ----\n" + elements.reversed().map { "\($0)" }.joined(separator: "\n") + "\n---------------"
    }
    
    // Push: 배열의 맨 뒤에 요소를 추가. 시간 복잡도 0(1)
    mutating func push(_ element: T){
        elements.append(element)
    }
    
    //Pop: 배열의 맨 뒤 요소를 제거. 시간 복잡도 0(1)
    mutating func pop() -> T?{
        return elements.popLast()
    }
    
    //스택의 가장 위 요소를 확인(삭제하지 않음)
    func peek() -> T?{
        return elements.last
    }
    
    //스택이 비어있는지 확인
    var isEmpty: Bool{
        return elements.isEmpty
    }
}

func StackExample(){
    var browserHistory = Stack<String>()
    
    print("\n// 웹 페이지 방문")
    browserHistory.push("https://www.naver.com")
    browserHistory.push("https://www.google.com")
    browserHistory.push("https://www.github.com")
    
    //현재 스택 상태 출력
    print(browserHistory)
    
    //가장 위의 요소를 확인만 하기(peek)
    if let currentPage = browserHistory.peek(){
        print("현재 페이지: \(currentPage)")
    }
    
    //뒤로 가기 (pop)
    print("뒤로가기")
    if let previousPage = browserHistory.pop(){
        print("이전 페이지: \(previousPage)")
    }
    
    print("현재 스택 상태")
    print(browserHistory)
}
