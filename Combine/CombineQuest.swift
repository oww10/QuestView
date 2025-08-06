import Foundation
import Combine

// 1. Combine 프레임워크
// Apple에서 제공하는 반응형 프로그래밍(Reactive Programming) 프레임워크.
// 데이터를 비동기적으로 처리하고, 이벤트를 선언적으로 처리하는 데 사용.
// 2. 주요 개념:
// Publisher: 데이터를 제공하는 주체.
// Subscriber: 데이터를 수신하고 처리하는 주체.
// Operators: 데이터를 변환하거나 필터링하는 중간 연산자.
// 3. Combine의 흐름:
// Publisher -> Operator -> Subscriber.

//1.간단한 Publisher와 Subscriber 만들기:
//배열 [10, 20, 30, 40, 50]을 Publisher로 생성하고, 각 값을 2배로 변환한 후 출력하세요.
class CombineExample {
    let numbers = [10 , 20 , 30 , 40 , 50 ].publisher
    
    var cancellables = Set<AnyCancellable>()
    
    func combineExample() {
        numbers
            .map { $0 * 2 }
            .sink { print($0) }
            .store(in: &cancellables)
    }
}


//2. Just Publisher 사용: 단일 값 100을 제공하는 Just를 사용하여 값을 변환(+50)하고 출력하세요.
class CombineExample2 {
    
    func combineExample2() {
        Just(100)
            .map { $0 + 50 }
            .sink { print($0) }
    }
}

// Combine으로 비동기 데이터 처리
// 1.
//URLSession과 Combine 사용:
//Combine을 사용해 네트워크 요청을 수행하고 결과를 출력하세요.
//API: https://jsonplaceholder.typicode.com/todos/1
//요청 결과의 title 값을 출력하세요.
class CombineExample3 {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    var cancellable: AnyCancellable?
    
    func combineExample3() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Todo.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: { print("Completion: \($0)") },
                receiveValue: { print("Title: \($0.title)") }
            )
    }
    struct Todo: Decodable {
        let title: String
    }
}



//2.
//Timer Publisher 사용:
//1초마다 현재 시간을 출력하는 Combine 타이머를 생성하세요.
//5초 후에는 구독을 취소하세요.
class CombineExample4 {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var cancellable: AnyCancellable?
    
    func combineExample4() {
        cancellable = timer
            .sink { print($0) }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.cancellable?.cancel()
            print ("Timer cancelled.")
        }
        
    }
}

