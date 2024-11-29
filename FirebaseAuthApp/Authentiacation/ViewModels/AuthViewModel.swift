

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor

final class AuthViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User? // firebase user
    @Published var currentUser: User? // our user
    
    @Published var isError : Bool = false // for do catch
    
    init(){
        
    }
    
    //create Auth and Firestore objects
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    
    //....create user entry on firestore ..Authentication..
    func createUser(email : String ,password : String, fullName : String) async {
        do {
          try await auth.createUser(withEmail: email, password: password)
        }catch {
            isError = true 
            print("Error \(error.localizedDescription)")
        }
    }
    
    //...Save User extra data to ...FirestoreDatabase...
    
//    func storeUserInFirestore(email : String, uid : String, fullName : String) async {
//
//        let user = User(uid: uid, email: email, fullName: fullName)
//        do {
//            try await firestore.collection("users").document(uid).setData([
//                "uid": user.uid,
//                "email": user.email,
//                "fullName": user.fullName
//            ])
//
//        }catch {
//            isError = true
//            print("Error \(error.localizedDescription)")
//        }
//    }
    
}
