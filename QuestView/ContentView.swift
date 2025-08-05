import SwiftUI
import UIKit




struct ContentView: View {
    
    let captureManager = captureVariable()
    
    var body: some View {
        VStack {
            
            
            
            
        }.onAppear {
            captureManager.runCaptureTest()
            
        }
    }
}

#Preview {
    ContentView()
}
