import Foundation

protocol Discountable {
    var originalPrice: Double { get }
    func discountedPrice(rate: Double) -> Double
}

extension Discountable {
    func finalPrice() -> Double {
        return discountedPrice(rate: 0.1) // 기본 10% 할인
    }
    
    func displayPrice() -> String {
        return "원가: \(originalPrice)원, 할인가: \(finalPrice())원"
    }
}
struct PercentageDiscount: Discountable {
    var originalPrice: Double
    var percentage: Double
    
    func discountedPrice(rate: Double) -> Double {
        return originalPrice * (1.0 - self.percentage)
    }
}

class VIPDiscount: Discountable {
    var originalPrice: Double
    
    enum Level {
        case Gold, Silver, Bronze //enum으로 vipLevel 정의
    }
    var vipLevel: Level

    init(price: Double, level: Level) {
        self.originalPrice = price
        self.vipLevel = level
    }


    func discountedPrice(rate: Double) -> Double {
        let gradeDiscount: Double
        
        switch vipLevel { //level별 차등 할인
        case .Gold:
            gradeDiscount = 0.15 // Gold: 15%
        case .Silver:
            gradeDiscount = 0.10 // Silver: 10%
        case .Bronze:
            gradeDiscount = 0.05 // Bronze: 5%
        }
        return originalPrice * (1.0 - gradeDiscount)
    }
}

func DiscountTest() {
    let book = PercentageDiscount(originalPrice: 100, percentage: 0.2) //PercenteageDiscount()
    
    let hotel = VIPDiscount(price: 1000, level: .Gold) // VIPDiscount()
    
    print("--- PercentageDiscount (책) ---")
    
    print("자체 할인 적용가: \(book.discountedPrice(rate: 0))원")
    
    print(book.displayPrice())
    print("--------------------------------\n")


    print("--- VIPDiscount (호텔) ---")
    
    print("자체 할인 적용가: \(hotel.discountedPrice(rate: 0))원")
    
    print(hotel.displayPrice())
    print("----------------------------\n")
}
