import SwiftUI
import UIKit




struct ContentView: View {
   
    let example = CombineExample()
    let example2 = CombineExample2()
    let exaple3 = CombineExample3()
    let exaple4 = CombineExample4()
    var body: some View {
        VStack {
            
            
            
            
        }.onAppear {
            //example.combineExample()
            //example2.combineExample2()
            //exaple3.combineExample3()
            exaple4.combineExample4()
        }
    }
}

#Preview {
    ContentView()
}
