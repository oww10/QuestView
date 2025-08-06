import Foundation



func CallUserData() {
    let userData: [Any] = ["John", 30, "New York"]
    
    let userName = userData[0]
    let userAge = userData[1]
    let userCity = userData[2]
    print("매직넘버 수정 전")
    print("Hello, my name is \(userName) and I am \(userAge) years old. I live in \(userCity).")
    
    if userData.count == 3{
        print ("데이터 길이가 유요합니다.")
    }else{
        print ("잘못된 데이터 형식입니다.")
    }
}

func CallUserData2() {
    struct User{
        let name: String
        let age: Int
        let city:String
    }
    
    let user = User(name: "John", age: 30, city: "New York")
    print("매직넘버 수정 후")
    print("name:\(user.name), age:\(user.age), city: \(user.city)")
}
