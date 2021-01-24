// MARK: - Task 1

var array = [[45, 12], [10, 19], [191, 3], [41, 81]]
array = array.map { $0.sorted() }
array.sort { $0[0] > $1[0] }
print(array)

// MARK: - Task 2

func getDictionaryByString(string: String) -> [Character: Int] {
    var dict = [Character: Int]()
    string.map {
        if dict[$0] != nil {
            dict[$0]! += 1
        } else {
            dict[$0] = 1
        }
    }
    return dict
}
print(getDictionaryByString(string: "Hello world"))

// MARK: - Task 3

func getStringWithUpperCase(stringsWithBlanks: String) -> [String] {
    let strings = stringsWithBlanks.split(separator: " ")
    return strings.compactMap {
        $0[$0.startIndex].isUppercase ? String($0) : nil
    }
}
print(getStringWithUpperCase(stringsWithBlanks: "Hello world! Today is a great day for coding!"))
