import Foundation

struct Product{
    let id: String
    var name: String
    var price: Double
    let category: String
    
    func testChageValue(){
        var originalProduct = Product(id: "1", name: "test", price: 100, category: "test")
        let copiedProduct = originalProduct
        
        print("가격 변경 전 원본 가격 \(originalProduct.price)")
        print("가격 변경 전 복제 가격 \(copiedProduct.price)")
        
        originalProduct.price = 12000
        
        print("================================")
        
        print("가격 변경 후 원본 가격 \(originalProduct.price)")
        print("가격 변경 후 복제 가격 \(copiedProduct.price)")
    }
}

func runStructTest(){
    let productInstance = Product(id: "1", name: "test", price: 100, category: "test")
    
    productInstance.testChageValue()
}
