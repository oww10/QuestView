import Foundation

func arrayExample() {
    //요소를 갖는 배열 생성
    var numbers = [1, 2, 3, 4, 5]
    
    //배열의 끝에 요소 추가(append)
    numbers.append(6)
    
    // 인덱스를 사용하여 요소에 접근
    print(numbers[1])//2
    
    //인덱스 2의 위치에 요소 삽입(insert)
    numbers.insert(10, at: 2)//[1,2,10,3,4,5,6)
    
    //인덱스 0의 위치에 요소 삭제(remove)
    numbers.remove(at: 0)//[2,10,3,4,5,6]
    
}

func printAddress(of array: UnsafeRawPointer, name: String) {
    print("\(name)의 메모리 주소: \(array)")
}

func COWArrayExample() {
    print("--- 1. array1 생성 ---")
    let array1 = [1, 2, 3]
    // withUnsafeBytes를 사용해 array1의 실제 데이터가 저장된 메모리 주소를 확인
    array1.withUnsafeBytes { pointer in
        printAddress(of: pointer.baseAddress!, name: "array1")
    }
    print("\n--- 2. array2에 array1 할당 ---")
    var array2 = array1 // 아직 복사되지 않고, 같은 메모리를 공유
    array1.withUnsafeBytes { pointer in
        printAddress(of: pointer.baseAddress!, name: "array1")
    }
    array2.withUnsafeBytes { pointer in
        printAddress(of: pointer.baseAddress!, name: "array2")
    }
    print("-> 주소가 동일합니다. 두 변수가 같은 메모리를 공유하고 있습니다.")
    
    print("\n--- 3. array2 수정 (Copy-on-Write 발생 시점) ---")
    array2.append(4) // array2가 수정되는 시점에 복사가 일어남
    print(array2)
    
    print("\n--- 4. 수정 후 메모리 주소 확인 ---")
    
    array1.withUnsafeBytes { pointer in
        printAddress(of: pointer.baseAddress!, name: "array1")
    }
    array2.withUnsafeBytes { pointer in
        printAddress(of: pointer.baseAddress!, name: "array2")
    }
    print("-> 주소가 달라졌습니다! Copy-on-Write가 발생하여 array2를 위한 새로운 메모리가 할당 및 복사되었습니다.")
    
    print("\n--- 최종 결과 ---")
    print(array1)
    print(array2)
}
