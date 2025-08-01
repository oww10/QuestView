import Foundation

class ShoppingCart{
    var items: [ProductClass] = []
    
    var totalPrice: Double{
        return items.reduce(0.0) {
            (sumProduct, Product) -> Double in
            return sumProduct + Product.price
        }
    }
    
    func addItem(_ Product: ProductClass){
        items.append(Product)
        print("\(Product.name)을 장바구니에 추가했습니다.")
    }
    func removeItem(at index: Int){
        if items.indices.contains(index){
            let removeItem = items.remove(at: index)
            
            print("\(removeItem.name)을 장바구니에서 제거했습니다.")
        }else{
            print( "존재하지 않는 상품입니다.")
        }
    }
}

func shoppingCartTest(){
    let cart = ShoppingCart()
    let copiedCart = cart
    
    let product1 = ProductClass(id: "1", name: "test1", price: 100, category: "test")
    let product2 = ProductClass(id: "2", name: "test2", price: 200, category: "test")
    
    print("내 카트의 물건 숫자 \(cart.items.count)")
    print("복제 카트의 물건 숫자 \(copiedCart.items.count)")
    
    cart.addItem(product1)
    print("원본 카트에 \(product1.name) 추가 ")
    cart.addItem(product2)
    print("원본 카트에 \(product2.name) 추가 ")
    
    print("추가 후 내 카트의 물건 숫자 \(cart.items.count)")
    print("추가 후 복제 카트의 물건 숫자 \(copiedCart.items.count)")
    
    copiedCart.removeItem(at: 0)
    print("복제 카트에 \(product1.name) 제거 ")
    
    print("제거 후 내 카트의 물건 숫자 \(cart.items.count)")
    print("제거 후 복제 카트의 물건 숫자 \(copiedCart.items.count)")
}
