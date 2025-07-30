//optionalQuest.Swift
import Foundation

struct optionalTest1{
    func optional1(name:String, age:Int, birthYear:Int, car:String?) -> String{
        let total:String = "\(name), \(age), \(birthYear), \(car ?? "nil")"
        return total
    }
}

struct optionalTest2{
    func checkScore(forName name: String) -> String {
        let studentScore = ["Tom": 85, "Jason": 92, "David": 78, "Lisa": 88]
        
        if let score = studentScore[name] {
            return "\(name) \(score)점"
        } else {
            return "\(name) 점수 없음"
        }
    }
}

struct optionalTest3{
    func checkScore(forName name: String) -> String {
        let studentScore = ["Tom": 85, "Jason": 92, "David": 78, "Lisa": 88]
        
        guard let score = studentScore[name] else {
            return "\(name) 점수 없음"
        }
        return "\(name) \(score)점"
    }
}

struct optionalTest4{
    func checkScore(forName name: String) -> String {
        let studentScore = ["Tom": 85, "Jason": 92, "David": 78, "Lisa": 88]
        
        
        //let studentScore1 = studentScore[name]!
        //기존 코드에서 개선 방법 : !를 쓰기 전에 nil이 아닌지 직접 검사하기
        if studentScore[name] != nil {
            let studentScore1 = studentScore[name]!
            return "\(name) \(studentScore1)점"
        } else{
            return "\(name) 점수 없음"
        }
        
    }
}

struct optionalTest5{
    func checkScore(forName name: String) -> String {
        let studentScore = ["Tom": 85, "Jason": 92, "David": 78, "Lisa": 88]
        
        let studentScore1 = studentScore["Jane"] ?? 0
        return "미등록 점수(기본값 사용): \(studentScore1)점"
        
    }
}

struct optionalTest6{
    func talkProgram(userInput userTextInput:String?) -> String{
        
        
        if let userInputText = userTextInput{
            
            if let age = Int(userInputText){
                return("입력한 나이: \(age)살")
            } else{
                return ("올바른 나이를 입력해주세요.")
            }
        } else{
            return ("입력이 없습니다.")
        }
    }
}


//import SwiftUI
//
//struct ContentView: View {
//    let optional1test = optionalTest1()
//    let optional2test = optionalTest2()
//    let optional3test = optionalTest3()
//    let optional4test = optionalTest4()
//    let optional5test = optionalTest5()
//    let optional6test = optionalTest6()
//    @State private var userInput: String = ""
//    
//    
//    
//    var body: some View {
//        VStack {
//            
//            let totalText = optional1test.optional1(name: "Alice",age: 20,birthYear: 2003,car: nil)
//            Text("totalText: \(totalText)")
//            
//            let findScore = optional2test.checkScore(forName: "Tom")
//            Text("findScore: \(findScore)")
//            
//            let findScore2 = optional2test.checkScore(forName: "David")
//            Text("findScore2: \(findScore2)")
//            
//            let findScore3 = optional3test.checkScore(forName: "David")
//            Text("findScore3: \(findScore3)")
//            
//            let findScore4 = optional4test.checkScore(forName: "Jane")
//            Text("findScore4: \(findScore4)")
//            
//            let findScore5 = optional5test.checkScore(forName: "Jane")
//            Text("findScore5: \(findScore5)")
//            
//                
//            
//            TextField("나이를 입력하세요", text:$userInput)
//                .padding()
//                .multilineTextAlignment(.center)
//            let talkResult = optional6test.talkProgram(userInput: userInput)
//            Text("\(talkResult)")
//            
//            
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
