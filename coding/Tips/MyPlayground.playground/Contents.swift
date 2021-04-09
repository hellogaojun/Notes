import UIKit


/// Tuple

//var error = (1,"没有权限")
//print(error.0)
//print(error.1)

//var error: (errorCode: Int, errorMessage: Any) = (200,"success")
//error.errorCode = 300
//print(error)
//error.errorMessage = 666
//print(error)

//let error = (1,"没有权限")
//let (errorCode, errorMessage) = error
//print(errorCode)
//print(errorMessage)
//
//func writeFile(content: String) -> (errorCode: Int, errorMessage: String) {
//    return error
//}
//print(error)


/// Optional

//let str: String? = "abc"
//if str != nil {
//    let count = str!.count
//    print(count)
//}

//if let acturalStr = str {
//    let count = acturalStr.count
//    print(count)
//}
//
//let str2: String! = "abc"
//let count = str2.count
//print(count)

let str: Optional<String> = "abc" //Optional本质是enum
//if let acturalStr = str {
//    let count = acturalStr.count
//    print(count)
//}

if str != nil {
    let count = str.unsafelyUnwrapped.count
    print(count)
}

