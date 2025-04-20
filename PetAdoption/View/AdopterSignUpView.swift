//
//  AdopterSignUpView.swift
//  PetAdoption
//
//  Created by Goran Saric on 14.04.25.
//

import SwiftUI

struct AdopterSignUpView: View {
    @State private var nameAppear: Bool = false
    @State private var emailAppear: Bool = false
    @State private var passwordAppear: Bool = false
    @State private var repeatPasswordAppear: Bool = false
    @State private var signUpButtonAppear: Bool = false
    
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
                VStack {
                    Text("Adopter Sign Up")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontDesign(.monospaced)
                        .padding(.top)
                    Image("cutecat")
                        .frame(height: 258)
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
                            .padding(.top)
                            .offset(y: signUpButtonAppear ? 0 : UIScreen.main.bounds.height)
                            .animation(.easeInOut(duration: 1.2), value: signUpButtonAppear)
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            signUpButtonAppear = true
        }
    }
}

#Preview {
    AdopterSignUpView()
}


