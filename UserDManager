import Foundation

class UserDManager {

    // define all keys needed
    enum DefaultsKey: String, CaseIterable {
        case language
        case userLogin
        case onBoarding
        case userEmail
    }
    
    static let shared = UserDManager()
    private let defaults = UserDefaults.standard
    
    init() {}
    
    // to set value using pre-defined key
    func set(_ value: Any?, key: DefaultsKey) {
        defaults.setValue(value, forKey: key.rawValue)
    }
    
    // get value using pre-defined key
    func get(key: DefaultsKey) -> Any? {
        return defaults.value(forKey: key.rawValue)
    }
    
    // check value if exist or nil
    func hasValue(key: DefaultsKey) -> Bool {
        return defaults.value(forKey: key.rawValue) != nil
    }
    
    // remove key stored values
    func removeKey(key: DefaultsKey) {
        defaults.removeObject(forKey: key.rawValue)
    }
    
    // remove all stored values
    func removeAll() {
        for key in DefaultsKey.allCases {
            defaults.removeObject(forKey: key.rawValue)
        }
    }
    
}
