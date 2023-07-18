# User Defaults Manager

Using this class, you can easily store and manage your important information.

## Support and features

- String
- Int
- Bool
- Array Any
- Array String
- Array Int
- Dictionary
- Data
- JSONDecoder
- Double
- Float

## Installation

Download UserDManager.swift, add and insert in to your project.

## Add new key

First add your case into UserDefaultsKeys.

```swift
enum UserDefaultsKeys: String, CaseIterable {
 case isLogin
}
```

## Usage

Insert this code.

```swift
private let userDManager = UserDManager()
```

## Set and save data

```swift
userDManager.set("Amin", to: .name) //String
userDManager.set(10, to: .level) //Int
userDManager.set(54.0000, to: .locationCode) //Double
userDManager.set(3.14, to: .progress) //Float
userDManager.set(true, to: .isLogin) //Boolean
userDManager.set(8.6, to: .lastUpdateNotification) //Double
userDManager.set(["hello", "hi", "bye"], to: .arrayString) //String Array
userDManager.set([1, 2, 3], to: .arrayInt) //Array Int
userDManager.set(["one": 1, "two":2, "three":3], to: .dictionary) //Dictionary
```
or insert direct

```swift
UserDManager.shared.set("Amin", to: .name)
```

## For insert and set object for sample

First create object.

```swift
struct UserObject: Codable {
    let name: String
    let age: Int
}

//Insert object
let myObject = UserObject(name: "Amin BesharatNia", age: 32)
userDManager.setObj(myObject, to: .decodedObject)
```

## Get and retrieved

```swift
// For get String
let getString = userDManager.getString(for: .name)
//output -> Amin

// For get String optional
let getStringO = userDManager.getStringO(for: .name)
//output -> optional(Amin)

// For get handle String optional
if let getStringName = userDManager.getStringO(for: .name) {
    print(getStringName) //output -> Amin
}else{
     print("is empty")
 }

// For get Int 
let getInt = userDManager.getInt(for: .level)
//output -> 10

// For get Bolean 
let getBool = userDManager.getBool(for: .isLogin)
//output -> true

// For get any array: [String], [Int], ... 
let getArray: [String] = userDManager.getArray(for: .arrayString)
//output -> ["hello", "hi", "bye"]

// For get String Array 
let getArrayString = userDManager.getArrayString(for: .arrayString)
//output -> ["hello", "hi", "bye"]

// For get Array Int 
let getArrayInt = userDManager.getArrayInt(for: .arrayInt)
//output -> [1, 2, 3]

// For get Dictionary
let getDictionary = userDManager.getDictionary(for: .dictionary)
//output -> ["one": 1, "two":2, "three":3]

// or get Object 
if let retrievedObject: UserObject = userDManager.getDecodedObject(for: .decodedObject) { 
    print("Name: \(retrievedObject.name)") //output -> Amin
    print("Age: \(retrievedObject.age)") //output -> 32
} else {
    print("No object found in UserDefaults.")
}
```

## Chack existing

```swift
let hasValue = userDManager.hasValue(key: .name)
//output -> true or false
```

## Access key

```swift
let key = UserDefaultsKeys.locationCode
//output -> locationCode

let rawValue = key.value
//output -> location_code
```

## Remove

```swift
// remove all data
userDManager.removeAll()

// remove for one key
userDManager.removeForKey(.name)

// remove all excluded
userDManager.removeAllEx()

// remove All This keys   
let keysToKeep: [UserDefaultsKeys] = [.isLogin, .theme, .lastUpdateNotification]
userDManager.removeAllThis(for: keysToKeep)

// remove All Keys, Except and Keep This keys        
let keysToRemove: [UserDefaultsKeys] = [.name, .level, .progress]
userDManager.removeAllExcept(for: keysToRemove)

```

## About the Author

Create by Amin BesharatNia.

