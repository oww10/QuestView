import Foundation

class Person{
    var name: String
    var pet: Pet?
    
    init(name:String){
        self.name = name
        print ("Person \(name) init")
    }
    deinit {
        print ("Person \(name) deinit")
    }
}

class Pet{
    //weak로 순환 참조 해결
    weak var Owner: Person?
    
    init(){
        print ("Pet init")
    }
    
    deinit{
        print ("Pet deinit")
    }
}

func ARCExample(){
    print("--- 예제 시작 ---")
    var person: Person? = Person(name: "Alice") // person의 참조 횟수: 1
    var pet: Pet? = Pet()                     // pet의 참조 횟수: 1
    
    // 서로를 강하게 참조하여 순환 참조 발생
    person?.pet = pet // pet의 참조 횟수: 2 (pet 변수, person.pet 프로퍼티)
    pet?.Owner = person // person의 참조 횟수: 2 (person 변수, pet.owner 프로퍼티)
    
    print("\n--- 참조 관계 설정 완료 ---")
    print("이제 person과 pet을 nil로 만들어 참조를 끊어보겠습니다.")
    
    person = nil // person의 참조 횟수: 1 (여전히 pet.owner가 잡고 있음)
    pet = nil    // pet의 참조 횟수: 1 (여전히 person.pet이 잡고 있음)
    
    print("\n--- 예제 종료 ---")
    print("-> deinit이 모두 호출되어 메모리가 안전하게 해제되었습니다.")
    
}


