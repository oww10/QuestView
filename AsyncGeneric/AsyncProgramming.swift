import Foundation

// 1. 비동기 프로그래밍
// 작업을 동시에 실행하거나, 완료 여부를 기다리지 않고 다음 작업을 수행할 수 있는 프로그래밍 방식
//iOS에서는 주로 GCD(Grand Central Dispatch)와 비동기 메서드를 사용

// 2. 동기 vs 비동기
// 동기(Synchronous): 작업이 완료될 떄 까지 대기
// 비동기(Asynchronous): 작업 완료를 기다리지 않고 바로 다음 작업 실행

// 3. GCD의 주요 큐:
// Main Queue: UI 작업을 처리.
// Global Queue: 백그라운드 작업 처리.
// Custom Queue: 사용자 정의 작업 큐



//비동기 데이터 처리:
//DispatchQueue.global()을 사용하여 백그라운드에서 숫자를 1부터 5까지 출력한 후, Main Queue에서 "UI 업데이트 완료"를 출력하세요.
struct AsyncProgramming {
    
    func AsyncExample() {
        DispatchQueue.global().async {
            print("비동기 작업 실행")
            for i in 1...5{
                print(i)
            }
            DispatchQueue.main.async {
                print( "UI 업데이트 완료")
            }
        }
    }
    
    //2.네트워크 시뮬레이션:
    //DispatchQueue를 사용해 다음을 구현하세요:
    //3초간 데이터를 로드하는 작업을 비동기로 수행.
    //작업 완료 후, "데이터 로드 완료" 메시지를 메인 큐에서 출력.
    
    func AsyncExample2() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 3.0)
            print("3초 경과 후 데이터 로드 완료")
            
            DispatchQueue.main.async {
                print( "데이터 로드 완료")
            }
        }
    }
}
