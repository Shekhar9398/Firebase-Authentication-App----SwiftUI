
import SwiftUI

struct CreateAccountView: View {
    
    @State private var email : String = ""
    @State private var fullName : String = ""
    
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    
    @StateObject private var authViewModel = AuthViewModel()
    
    var isValid : Bool {
        password == confirmPassword
    }
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack(spacing : 16){
            Text("Please fill all the information below to create an account")
                .foregroundStyle(.gray)
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            VStack(spacing : 16){
                TextField("Email", text: $email)
                Divider()
                
                TextField("Full Name", text: $fullName)
                Divider()
                
                SecureField("Password", text: $password)
                Divider()
                
                //.. Valid Password Image set
                ZStack(alignment: .trailing){
                    SecureField("Confirm Your Password", text: $confirmPassword)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        
                        Image(systemName: "\(isValid ? "checkmark" : "xmark").circle.fill")
                        
                            .foregroundColor(isValid ? Color.green : Color.red)
                    }
                }
                
                Divider()
                
                Spacer()
                
                // create account button
                Button {
                    //create task because of the assync funtion
                    Task {
                        await authViewModel.createUser(email: email, password: password, fullName:fullName)
                    }
                    //go back to loginView
                    dismiss()
                    
                } label: {
                    Text("Create Account")
                }
                .buttonStyle(CapsuleButtonStyle())
                
            }
            .toolbarRole(.editor)
            .navigationTitle("Set Up Your Account")
            .padding()
            
        }
        
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
