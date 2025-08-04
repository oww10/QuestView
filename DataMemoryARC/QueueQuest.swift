import Foundation

//큐(Queue)
//선입선출(FIFO, First In First Out) 구조
//데이터를 한쪽에서 삽입하고, 반대쪽에서 제거
//사용 사례: 프린터 작업 대기열, BFS 탐색

//이 프로토콜을 채택하면, print(myQueue)와 같이 print 함수에 우리 Queue 인스턴스를 넣었을 때 어떤 문자열을 출력할지 직접 정의할 수 있습니다.
struct Queue<T>: CustomStringConvertible{
    private var elements: [T] = []
    
    var description: String {
        if elements.isEmpty {
            return "현재의 Queue는 empty"
        }
        return "---- Queue ----\n" + elements.map { "\($0)" }.joined(separator: " <- ") + "\n---------------"
    }
    
    //Enqueue:배열의 맨 뒤에 요소를 추가. 시간 복잡도 0(1)
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    //Dequeue: 배열의 맨 앞에서 요소를 제거. 시간 복잡도 0(n)
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    //큐가 비어있는지 확인하는 프로퍼티
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    //큐의 맨 앞 요소를 확인하는 프로퍼티(삭제하지 않음)
    var front:T?{
        return elements.first
    }
}

func QueueExample(){

    // 1. Int 타입을 저장하는 새로운 큐를 만듭니다.
    var numberQueue = Queue<Int>()
    print(numberQueue) // "현재의 Queue는 empty" 출력

    print("\n// 1, 2, 3을 차례로 Enqueue 합니다.")
    numberQueue.enqueue(1)
    numberQueue.enqueue(2)
    numberQueue.enqueue(3)

    // 2. 현재 큐의 상태를 출력합니다.
    print(numberQueue)

    print("\n// Dequeue를 실행합니다.")
    // 3. Dequeue를 실행하고, 꺼내온 값을 상수에 저장합니다.
    if let firstElement = numberQueue.dequeue() {
        print("꺼내온 값: \(firstElement)") // 가장 먼저 넣었던 1이 나옵니다.
    }

    // 4. Dequeue 이후의 큐 상태를 출력합니다.
    print(numberQueue)


    print("\n// 40을 Enqueue 합니다.")
    numberQueue.enqueue(40)
    print(numberQueue)

    print("\n// 다시 Dequeue를 실행합니다.")
    if let secondElement = numberQueue.dequeue() {
        print("꺼내온 값: \(secondElement)") // 그 다음에 있었던 2가 나옵니다.
    }
    print(numberQueue)
}
