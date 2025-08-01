// 이 코드를 ContentView.swift 파일 상단이나 별도의 파일에 추가합니다.

import SwiftUI

struct FruitListView: UIViewControllerRepresentable {
    
    // SwiftUI가 UIKit 뷰 컨트롤러를 생성할 때 호출하는 메서드입니다.
    // 여기서 우리가 만든 FruitListViewController의 인스턴스를 생성하여 반환합니다.
    func makeUIViewController(context: Context) -> FruitListViewController {
        return FruitListViewController()
    }
    
    // SwiftUI 뷰가 업데이트될 때 UIKit 뷰 컨트롤러도 업데이트해야 할 경우 호출됩니다.
    // 지금은 특별히 업데이트할 내용이 없으므로 비워둡니다.
    func updateUIViewController(_ uiViewController: FruitListViewController, context: Context) {
        // 예: SwiftUI의 @State 변수가 바뀔 때 UIKit 뷰를 업데이트하고 싶다면 여기에 코드를 작성합니다.
    }
}

struct IphoneListView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> iphoneListViewController {
        return iphoneListViewController()
    }
 
    func updateUIViewController(_ uiViewController: iphoneListViewController, context: Context) {
        
    }
}

struct FruitDeleteAddView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> addOrRemoveViewController {
        return addOrRemoveViewController()
    }
    
    func updateUIViewController(_ uiViewController: addOrRemoveViewController, context: Context) {
        
    }
}
