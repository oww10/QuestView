import SwiftUI
import UIKit

struct ContentView: View {

    var body: some View {
        VStack {
        
            NavigationStack {
                
                FruitListView().ignoresSafeArea(.all)
            }
            
        }
        
        
        
        
    }
    
}

#Preview {
    ContentView()
}
