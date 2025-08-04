import Foundation

//1. Data 영역
//앱이 실행되는 동안 계속 유지되는 전역 변수와 정적 변수가 저장됩니다.
var globalCounter: Int = 10 // 전역 변수

struct AppConfig{
    //정적 변수
    static let appVersion = "1.0.0"
}

//2. Heap 영역
//동적으로 생성되고 해제되는 참조 타입(클래스)의 인스턴스가 저장됩니다.
class User{
    var name: String // User 인스턴스와 함께 Heap에 저장
    
    init(name: String){
        self.name = name
        print ("Heap: User \(name) 인스턴스가 Heap 메모리에 생성.")
    }
    
    deinit {
        print ("Heap: User \(name) 인스턴스가 Heap 메모리에 해제.")
    }
}

//3. Stack 영역
//함수가 호출될 때 생성되는 지역 변수, 매개변수 등이 저장됩니다.
//함수 실행이 끝나면 자동으로 사라집니다.

func processUser(user: User){
    print ("-> processUser 함수 스택 프레임이 Stack에 쌓입니다.")
    
    //'message'는 processUser 함수의 지역 변수이므로 Stack에 저장됩니다.
    let message = "Welcome"
    
    print("-> processUser Stack에 지역 변수 'message'(\(message))가 저장되었습니다.")
    
    print("-> [processUser] 함수 실행 완료. Stack에서 프레임이 제거됩니다.")
    // 함수가 종료되면 'message'는 Stack에서 사라집니다.
}

//4. Code 영역
//작성한 모든 코드가 영역에 로드되어 실행됩니다.
func DataMemoryTest(){
    print("-> [main] 함수 스택 프레임이 Stack에 쌓입니다.")
    
    // valueType은 값 타입이므로 데이터 자체가 Stack에 저장됩니다.
    var valueType = 20
    print("-> [main] Stack에 지역 변수 'valueType'(\(valueType))이 저장되었습니다.")
    
    // 'data' 영역의 변수에 접근합니다.
    print("-> Data 영역의 전역 변수 접근: globalCounter = \(globalCounter)")
    print("-> Data 영역의 정적 변수 접근: AppConfig.appVersion = \(AppConfig.appVersion)")
    
    // User 클래스 인스턴스를 생성합니다.
    // 'myUser'라는 참조 변수는 Stack에 생성되고,
    // 이 변수가 가리키는 실제 User 인스턴스는 Heap에 생성됩니다.
    var myUser: User? = User(name: "Alice")
    
    // 함수를 호출합니다.
    // myUser가 참조하는 Heap의 주소값이 processUser의 매개변수로 복사되어 Stack에 전달됩니다.
    if let userInstance = myUser {
        processUser(user: userInstance)
    }
    
    print("-> [main] myUser에 nil을 할당하여 Heap 객체 참조를 끊습니다.")
    myUser = nil // 참조 카운트가 0이 되면서 Heap의 User 인스턴스가 해제되고 deinit이 호출됩니다.
    
    print("-> [main] 함수 실행 완료. Stack에서 프레임이 제거됩니다.")
}

