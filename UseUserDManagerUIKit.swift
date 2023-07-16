import UIKit

class UseUserDManagerUIKit: UIViewController {
    
    private var userDManager = UserDManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //MARK: Usage 1
        //Save Name or Email: String
        let fullName = "Amin BesharatNia"
        userDManager.set(fullName, key: .userName)
        
        let userEmail = "amin.besharatnia@gmail.com"
        userDManager.set(userEmail, key: .userEmail)
        
        //Save Login: Boolean
        let isUserLogin = true
        userDManager.set(isUserLogin, key: .userLogin)
        
        
        //Get Name or Email: String
        let showName = userDManager.get(key: .userName)
        print(showName) // result: Optional(Amin BesharatNia)
        
        let showEmail = userDManager.get(key: .userEmail)
        print(showEmail) // result: Optional(amin.besharatnia@gmail.com)
        
        //Get Login: String
        let isLogined = userDManager.get(key: .userLogin)
        print(isLogined) // result: Optional(true)
        
        //MARK: Usage 2
        //Get Name
        if let viewName = userDManager.get(key: .userName) as? String {
            print(viewName) // result: amin.besharatnia@gmail.com
        }
        
        //Get Is Logined
        if let checkLogin = userDManager.get(key: .userLogin) as? Bool {
            print(checkLogin) // result: true
        }
        
        
        //MARK: change key
        let fullNameNew = "Amin"
        userDManager.set(fullNameNew, key: .userName)
        
        
        //MARK: Remove key
        userDManager.removeKey(key: .userName)
        
        //MARK: Remove All
        userDManager.removeAll()
    }
}
