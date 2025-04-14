//
//  AdopterSignUpView.swift
//  PetAdoption
//
//  Created by Goran Saric on 14.04.25.
//

import SwiftUI

struct AdopterSignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            Color.cyan.opacity(0.8).ignoresSafeArea()
            
            VStack{
                Text("Adopter Sign Up")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                Spacer()
                TextField("", text: $email, prompt:
                            Text("Enter your email").foregroundStyle(.white).fontDesign(.monospaced))
                .foregroundStyle(.white)
                .padding()
                .textContentType(.emailAddress)
                .frame(width: 300, height: 50)
                .background(Color(.cyan).opacity(0.5))
                .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(Color.white, lineWidth: 2)
                )
                
                //Password view
                SecureField("", text: $password, prompt:
                                Text("Enter your password").foregroundStyle(.white).fontDesign(.monospaced))
                .padding()
                .textContentType(.password)
                .frame(width: 300, height: 50)
                .background(Color(.cyan).opacity(0.5))
                .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(Color.white, lineWidth: 2)
                )
                .foregroundStyle(.white)
                SecureField("", text: $password, prompt:
                                Text("Re-Enter your password").foregroundStyle(.white).fontDesign(.monospaced))
                .padding()
                .textContentType(.password)
                .frame(width: 300, height: 50)
                .background(Color(.cyan).opacity(0.5))
                .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(Color.white, lineWidth: 2)
                )
                .foregroundStyle(.white)
                .padding(.bottom)
                Spacer()
            }
        }
    }
}

#Preview {
    AdopterSignUpView()
}
