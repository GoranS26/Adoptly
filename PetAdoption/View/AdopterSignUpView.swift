//
//  AdopterSignUpView.swift
//  PetAdoption
//
//  Created by Goran Saric on 14.04.25.
//

import SwiftUI

struct AdopterSignUpView: View {
    //Animation
    
    @State private var nameAppear: Bool = false
    @State private var emailAppear: Bool = false
    @State private var passwordAppear: Bool = false
    @State private var repeatPasswordAppear: Bool = false
    @State private var signUpButtonAppear: Bool = false
    //Error handling
    
    @State private var errorMessage: String? = nil
    @State private var showAlert = false
    @State private var shouldNavigate = false
    //User input
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.cyan.opacity(0.8).ignoresSafeArea()
                Divider()
                    .frame(width: .infinity, height: 5)
                    .background(Color.black)
                    .padding(.bottom, 98)
                    .shadow(color: .black, radius: 5)
                VStack {
                    Text("Adopter Sign Up")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontDesign(.monospaced)
                        .padding(.top)
                        .shadow(color: .black, radius: 2)
                    Image("cutecat")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .black, radius: 5)
                    Spacer()
                    
                    // Name Field
                    TextField("", text: $name, prompt:
                                Text("Can you tell me your name...").foregroundStyle(.white).fontDesign(.monospaced))
                    .foregroundStyle(.white)
                    .padding()
                    .textContentType(.name)
                    .frame(width: 350)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: nameAppear ? 0 : -UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 1.0), value: nameAppear)
                    

                    
                    // Email Field
                    TextField("", text: $email, prompt:
                                Text("Now your email...").foregroundStyle(.white).fontDesign(.monospaced))
                    .foregroundStyle(.white)
                    .padding()
                    .textContentType(.emailAddress)
                    .frame(width: 350)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: emailAppear ? 0 : UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 1.0), value: emailAppear)

                    
                    // Password Field
                    SecureField("", text: $password, prompt:
                                    Text("And your password...").foregroundStyle(.white).fontDesign(.monospaced))
                    .padding()
                    .textContentType(.password)
                    .frame(width: 350)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: passwordAppear ? 0 : -UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 1.0), value: passwordAppear)
                    .foregroundStyle(.white)
                    
                    // Repeat Password Field
                    SecureField("", text: $repeatPassword, prompt:
                                    Text("Password again, please...").foregroundStyle(.white).fontDesign(.monospaced))
                    .padding()
                    .textContentType(.password)
                    .frame(width: 350)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: repeatPasswordAppear ? 0 : UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 1.0), value: repeatPasswordAppear)
                    .foregroundStyle(.white)
                    
                    //Sign up button view
                    NavigationLink(destination: AdopterPovView()) {
                        Text("Sign Up")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .fontDesign(.monospaced)
                            .overlay(
                                Capsule().stroke(Color.white, lineWidth: 2)
                                    .frame(width: 200, height: 35)
                            )
                            .padding(.top, 50)
                            .offset(y: signUpButtonAppear ? 0 : UIScreen.main.bounds.height)
                            .animation(.easeInOut(duration: 1.1), value: signUpButtonAppear)
                    }
                    Spacer()
                }
                
                
                Spacer()
                .onAppear {
                    animatedFieldAppear()
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
    func animatedFieldAppear() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            nameAppear = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            emailAppear = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            passwordAppear = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            repeatPasswordAppear = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            signUpButtonAppear = true
        }
    }
    
    func validateSignUp() {
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Please enter your name"
            showAlert = true
            return
        }
        
        if !email.contains("@") || !email.contains(".") {
            errorMessage = "Please enter a valid email address"
            showAlert = true
            return
        }
        
        if password.count < 8 {
            errorMessage = "Password must be at least 8 characters long"
            showAlert = true
            return
        }
        
        if password != repeatPassword {
            errorMessage = "Passwords do not match"
            showAlert = true
            return
        }
        
        // ✅ If all is good:
        errorMessage = nil
        shouldNavigate = true
    }

}

#Preview {
    AdopterSignUpView()
}


