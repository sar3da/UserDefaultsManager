import SwiftUI

struct ContentView: View {
    @StateObject private var userDManager = UserDManager.shared
    
    var body: some View {
        VStack {
            
            //MARK: Save
            
            Button("Save Name") {
                let fullName = "Amin BesharatNia"
                userDManager.set(fullName, key: .userName)
            }
            
            Button("Save Email") {
                let userEmail = "amin.besharatnia@gmail.com"
                userDManager.set(userEmail, key: .userEmail)
            }
            
            Button("Save Login") {
                let isUserLogin = true
                userDManager.set(isUserLogin, key: .userLogin)
            }
            
            
            //MARK: Get
            //MARK: Usage 2
            Button("Get Name") {
                if let showName = userDManager.get(key: .userName) as? String {
                    print(showName)
                }
            }
            
            Button("Get Email") {
                if let showEmail = userDManager.get(key: .userEmail) as? String {
                    print(showEmail)
                }
            }
            
            Button("Get Login") {
                if let isLogined = userDManager.get(key: .userLogin) as? Bool {
                    print(isLogined)
                }
            }
            
            Button("Change Name") {
                let fullNameNew = "Amin"
                userDManager.set(fullNameNew, key: .userName)
            }

          //MARK: Remove key
            Button("Remove Name") {
                userDManager.removeKey(key: .userName)
            }

          //MARK: Remove All
            Button("Remove All") {
                userDManager.removeAll()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
