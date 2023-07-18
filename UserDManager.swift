import Foundation

// Define your custom object that conforms to the Decodable protocol
struct UserObject: Codable {
    let name: String
    let age: Int
}

enum UserDefaultsKeys: String, CaseIterable {
    
    case isLogin = "login"
    case locationCode = "location_code"
    // no need to purge
    case merchantID
    case level
    case lastUpdateNotification
    case theme = "Theme"
    case name = "name"
    case progress = "pr_level"
    case arrayString = "arrayS"
    case arrayInt = "arrayI"
    case dictionary = "Dictionary"
    case decodedObject = "decodedObject"
    case none = "none"
    
    // Excluded
    static var excludedCases: [UserDefaultsKeys] = [.merchantID, .lastUpdateNotification, .theme]
    
    var value : String {
        return self.rawValue
    }
    
}



class UserDManager {
    
    static let shared = UserDManager()
    public var storage: UserDefaults
    
    public init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
    }
    
    public func set(_ data: Any?, to key: UserDefaultsKeys, synchronize: Bool = false) {
        storage.set(data, forKey: key.rawValue)
        if synchronize {
            storage.synchronize()
        }
    }
    
    public func setObj<T: Encodable>(_ data: T?, to key: UserDefaultsKeys, synchronize: Bool = false) {
        guard let data = try? JSONEncoder().encode(data) else {
            return
        }
        set(data, to: key, synchronize: synchronize)
    }
    
    public func getString(for key: UserDefaultsKeys) -> String {
        storage.string(forKey: key.rawValue) ?? ""
    }
    
    public func getStringO(for key: UserDefaultsKeys) -> String? {
        storage.string(forKey: key.rawValue)
    }
    
    public func getInt(for key: UserDefaultsKeys) -> Int {
        storage.integer(forKey: key.rawValue)
    }
    
    public func getBool(for key: UserDefaultsKeys) -> Bool {
        storage.bool(forKey: key.rawValue)
    }

    public func getDouble(for key: UserDefaultsKeys) -> Double {
        storage.double(forKey: key.rawValue)
    }
    
    public func getFloat(for key: UserDefaultsKeys) -> Float {
        storage.float(forKey: key.rawValue)
    }
    
    public func getArray<T>(for key: UserDefaultsKeys) -> [T] {
        storage.array(forKey: key.rawValue) as? [T] ?? []
    }
    
    //Array String - sample: let getArray: [String] = class.getArray(for: .sample)
    public func getArrayString<T>(for key: UserDefaultsKeys) -> [T] {
        storage.array(forKey: key.rawValue) as? [T] ?? []
    }
    
    //Array Int
    public func getArrayInt(for key: UserDefaultsKeys) -> [Int] {
        storage.array(forKey: key.rawValue) as? [Int] ?? []
    }
    
    //Array Dictionary
    public func getDictionary(for key: UserDefaultsKeys) -> Dictionary<String, Any> {
        storage.dictionary(forKey: key.rawValue) ?? [:]
    }
    
    public func getObject<T>(for key: UserDefaultsKeys) -> T? {
        storage.object(forKey: key.rawValue) as? T
    }
    
    // Usage example
    //let myObject = MyObject(name: "Amin B", age: 32)
    public func getDecodedObject<T: Decodable>(for key: UserDefaultsKeys) -> T? {
        guard let data: Data = getObject(for: UserDefaultsKeys(rawValue: key.rawValue) ?? .none) else { return nil }
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(T.self, from: data)
    }
    
    
    //MARK: Check
    
    // check value if exist or nil
    public func hasValue(key: UserDefaultsKeys) -> Bool {
        return storage.value(forKey: key.rawValue) != nil
    }

    
    //MARK: Remove
    
    // remove for one key
    public func removeForKey(_ key: UserDefaultsKeys) {
        storage.removeObject(forKey: key.rawValue)
        storage.synchronize()
    }
    
    // remove all data
    public func removeAll() {
        let keys = UserDefaultsKeys.allCases
        keys.forEach {
            removeForKey($0)
        }
    }
    
    // remove all excluded
    public func removeAllEx() {
        let allKeys = UserDefaultsKeys.allCases
        let excludedKeys = UserDefaultsKeys.excludedCases
        
        allKeys.forEach { key in
            if !excludedKeys.contains(key) {
                removeForKey(key)
            }
        }
    }
    
    // remove All This keys
    public func removeAllThis(for keys: [UserDefaultsKeys]) {
        keys.forEach {
            removeForKey($0)
        }
    }
    
    // remove All Keys, Except and Keep This keys
    public func removeAllExcept(for keysToKeep: [UserDefaultsKeys]) {
        let allKeys = UserDefaultsKeys.allCases
        
        allKeys.forEach { key in
            if !keysToKeep.contains(key) {
                removeForKey(key)
            }
        }
    }
    
}
