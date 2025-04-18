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
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.cyan.opacity(0.8).ignoresSafeArea()

                VStack {
                    Text("Adopter Sign Up")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontDesign(.monospaced)
                        .padding(.top, 30)

                    Image("cutecat")
                        .resizable()
                        .frame(width: 250, height: 250)

                    // Name Field
                    TextField("", text: $name, prompt:
                                Text("Can you tell me your name").foregroundStyle(.white).fontDesign(.monospaced))
                    .foregroundStyle(.white)
                    .padding()
                    .textContentType(.name)
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: nameAppear ? 0 : -UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 0.9), value: nameAppear)
                    .padding(.top)
                    
                    // Email Field
                    TextField("", text: $email, prompt:
                                Text("Now your email").foregroundStyle(.white).fontDesign(.monospaced))
                    .foregroundStyle(.white)
                    .padding()
                    .textContentType(.emailAddress)
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: emailAppear ? 0 : UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 0.9), value: emailAppear)
                    .padding(.top)
                    
                    // Password Field
                    SecureField("", text: $password, prompt:
                                    Text("And your password").foregroundStyle(.white).fontDesign(.monospaced))
                    .padding()
                    .textContentType(.password)
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: passwordAppear ? 0 : -UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 0.9), value: passwordAppear)
                    .foregroundStyle(.white)
                    .padding(.top)
                    
                    // Repeat Password Field
                    SecureField("", text: $repeatPassword, prompt:
                                    Text("Password again, please...").foregroundStyle(.white).fontDesign(.monospaced))
                    .padding()
                    .textContentType(.password)
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: repeatPasswordAppear ? 0 : UIScreen.main.bounds.width)
                    .animation(.easeInOut(duration: 0.9), value: repeatPasswordAppear)
                    .foregroundStyle(.white)
                    .padding(.top)
                    
                    Spacer()
                }
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
    }
}

#Preview {
    AdopterSignUpView()
}


