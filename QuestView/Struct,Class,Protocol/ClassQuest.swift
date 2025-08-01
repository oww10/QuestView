import Foundation

class ProductClass{
    let id: String
    var name: String
    var price: Double
    let category: String
    
    init(id: String, name: String, price: Double, category: String) {
        self.id = id
        self.name = name
        self.price = price
        self.category = category
    }
}

func testChageValue(){
    let originalProduct = ProductClass(id: "1", name: "test", price: 100, category: "test")
    let copiedProduct = originalProduct
    
    print("가격 변경 전 원본 가격 \(originalProduct.price)")
    print("가격 변경 전 복제 가격 \(copiedProduct.price)")
    
    originalProduct.price = 12000
    print("================================")
    print("가격 변경 전 원본 가격 \(originalProduct.price)")
    print("가격 변경 전 복제 가격 \(copiedProduct.price)")
}
