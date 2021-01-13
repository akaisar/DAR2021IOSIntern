import UIKit

var arr: Array<Int> = [3, 1, 5, 4, 1, 6]

for i in 0..<arr.count {
    for j in stride(from: i, to: 0, by: -1) {
        if arr[j] < arr[j-1] {
            arr.swapAt(j, j-1)
        } else {
            break
        }
    }
}

print(arr)
