//functionQuest.Swift
import Foundation

struct funcTest1{
    
    func addNumbers(num1:Int, num2:Int) -> Int {
        return num1 + num2
    }
    
}

struct funcTest2{
    func numberComparison(num1:Int, num2:Int) -> Int {
        if num1 > num2 {
            return num1
        } else{
            return num2
        }
    }
}

struct funcTest3{
    func calculateAverage(num1:Int, num2:Int) -> Double {
        return Double(num1 + num2)/2
    }
}

struct multiplyNumbers{
    func multiply(num1:Int) -> [Int] {
        var nums:[Int] = []
        for i in 1...9 {
            nums.append(num1*i)
        }
        return nums
    }
}
struct multiplyNumberInt{
    func multiply(num1 number:Int) -> String {
        
        var resultString:String = ""
        
        for i in 1...9 {
        let result =  number * i
            resultString += "\(number) * \(i) = \(result)\n"
        }
        return resultString
    }
}

//struct ContentView: View {
//    
//    let func1test = funcTest1()
//    let func2test = funcTest2()
//    let func3test = funcTest3()
//    let multiplyTest = multiplyNumbers()
//    
//    var body: some View {
//        VStack {
//            
//            
//            let sum = func1test.addNumbers(num1: 10, num2: 20)
//            Text("Sum: \(sum)")
//            
//            let compare = func2test.numberComparison(num1: 10, num2: 20)
//            Text("Compare: \(compare)")
//            
//            let average = func3test.calculateAverage(num1: 10, num2: 20)
//            Text("Average: \(average)")
//            
//            let multiplyResult = multiplyTest.multiply(num1: 2)
//            Text("Multiply Result: \(multiplyResult)")
//            
//        }
//        .padding()
//    }
//}
