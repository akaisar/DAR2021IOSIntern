// MARK: - Task 1

var array = [[45, 12], [10, 19], [191, 3], [41, 81]]
array = array.map { $0.sorted() }
array.sort { $0[0] > $1[0] }
print(array)

// MARK: - Task 2

func getDictionaryByString(string: String) -> [Character: Int] {
    var dict = [Character: Int]()
    for i in string {
        if dict[i] != nil{
            dict[i]! += 1
        } else {
            dict[i] = 1
        }
    }
    return dict
}
print(getDictionaryByString(string: "Hello world"))

// MARK: - Task 3

func getStringWithUpperCase(stringsWithBlanks: String) -> [String] {
    let strings = stringsWithBlanks.split(separator: " ")
    var stringsWithUpperCase = [String]()
    for string in strings {
        if string[string.startIndex].isUppercase {
            stringsWithUpperCase.append(String(string))
        }
    }
    return stringsWithUpperCase
}
print(getStringWithUpperCase(stringsWithBlanks: "Hello world! Today is a great day for coding!"))
