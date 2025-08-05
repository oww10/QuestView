import Foundation

// 1. 객체지향 프로그래밍(OOP)
// 객체(Object)를 기반으로 프로그램을 설계하는 방식.
// 주요원칙:
// 캡슐화(Encapsulation): 데이터를 숨기고 외부에는 필요한 인터페이스만 제공.
// 상속(Ingeritance): 기존 클래스를 확장하여 새로운 클래스를 생성.
// 다형성(Polymorphism): 같은 메서드를 다양한 방식으로 동작하게 함.
// 추상화(Abstraction): 불필요한 세부 사항을 숨기고 중요한 부분만 표현.
// 2. 클래스와 객체
// 클래스(Class): 객체를 정의하기 위한 청사진
// 객체(Object): 클래스에서 생성된 실제 인스턴스

//OOP 기본 예제

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("makes a sound")
    }
    
}
class Dog: Animal {
    override func makeSound() {
        print(" barks")
    }
}

class Cat: Animal {
    override func makeSound() {
        print(" meows")
    }
}

func DogCatExample() {
    let dog = Dog(name: "Max")
    let cat = Cat(name: "Whiskers")
    let dog2 = Dog(name: "Daisy")
    
    let animals: [Animal] = [dog, cat, dog2]
    
    
    for animal in animals {
        
        var animalType = "알 수 없는 동물"
        
        if animal is Dog {
            animalType = "강아지"
        }
        else if animal is Cat {
            animalType = "고양이"
        }
        
        print ("현재 울음소리의 동물타입은 \(animalType)이며 이름은 \(animal.name)입니다.")
        
        animal.makeSound()
    }
}
