
import SwiftUI

struct LoginPageView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    @State private var isLoginSuccessfull = false
    
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing : 16){
                    //..logo
                    logo
                    
                    Spacer()
                    
                    //Email and Password
                    emailPassword
                    
                    // Forgot Button
                    forgotButton
                    
                    //Login Button
                    loginButton
                    MainScreenNavigation
                    
                    Spacer()
                    
                    //Botton view
                    bottomView
                    
                }
                .ignoresSafeArea()
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
    }
    
    private var logo : some View {
        Image("authImage")
            .resizable()
            .scaledToFit()
    }
    
    private var emailPassword : some View {
        VStack(spacing: 16){
            TextField("Enter your Email", text: $email)
            
            Divider()
            
            SecureField("Enter Your Password", text: $password)
            
            Divider()
        }
    }
    
    private var loginButton : some View {
        Button {
            //Navigation Trigger
            isLoginSuccessfull = true
        } label: {
            Text("Login")
        }
        .buttonStyle(CapsuleButtonStyle())
        
    }
    
    //Navigation Code For HomeScreen
    private var MainScreenNavigation : some View {
        NavigationLink(destination: MainScreenView(), isActive:$isLoginSuccessfull ){
            EmptyView()
        }
    }
    
    private var forgotButton : some View {
        HStack {
            Spacer()
            
            Button {
                //...Forgot action code
            } label: {
                Text("Forgot Password?")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
    }
    
    private var bottomView : some View {
        VStack(spacing : 20) {
            //or line
            orline
            
            // apple signUp Button
            appleButton
            
            //..Google Sign Up Button
            googleButton
            
            //Footer
            footer
        }
    }
    
    private var orline : some View{
        HStack(spacing : 20){
            line
            Text("or")
                .fontWeight(.semibold)
            line
        }
        .foregroundStyle(.gray)
    }
    
    private var appleButton : some View{
        Button {
            //..apple signUp Code
        } label: {
            Label("Sign Up with apple", systemImage: "apple.logo")
        }
        .buttonStyle(CapsuleButtonStyle(bgColor: .black))
    }
    
    private var googleButton : some View{
        Button {
            //..Google Button Code
        } label: {
            HStack {
                Image("googleLogo")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text("Sign Up with google")
            }
        }
        .buttonStyle(CapsuleButtonStyle(
            textColor: .black,
            bgColor: .clear,
            hasBorder: true)
        )
    }
    
    private var footer : some View{
        NavigationLink {
            CreateAccountView()
        } label: {
            HStack{
                Text("Dont have an account?")
                    .foregroundColor(.black)
                
                Text("Sign Up")
                    .foregroundColor(.teal)
            }
        }
        
    }
    
    //..->Custom Views
    private var line : some View {
        VStack{
            Divider()
                .frame(height: 1)
        }
    }
    
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
