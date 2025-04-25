//
//  ShelterSignUpView.swift
//  PetAdoption
//
//  Created by Goran Saric on 14.04.25.
//

import SwiftUI

struct ShelterSignUpView: View {
//    @State private var emailAppear: Bool = false
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.8).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Shelter Sign Up")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontDesign(.monospaced)
                    .padding(.top, 50)
                Spacer()
                TextField("", text: $email, prompt:
                            Text("Please type your email").foregroundStyle(.white).fontDesign(.monospaced))
                .foregroundStyle(.white)
                .padding()
                .textContentType(.emailAddress)
                .frame(width: 300, height: 50)
                .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(Color.white, lineWidth: 3)
                )
//                .offset(x: emailAppear ? 0 : UIScreen.main.bounds.width)
//                .animation(.easeInOut(duration: 0.9), value: emailAppear)
                .padding(.top)
                SecureField("", text: $password, prompt:
                                Text("Please type your password").foregroundStyle(.white))
                    .foregroundStyle(.white)
                    .fontDesign(.monospaced)
                    .padding()
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 3)
                    )
                SecureField("", text: $password, prompt:
                                Text("Re-type your password").foregroundStyle(.white))
                    .foregroundStyle(.white)
                    .fontDesign(.monospaced)
                    .padding()
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 3)
                    )
                
               Spacer()
            }
        }
    }
}

#Preview {
    ShelterSignUpView()
}
