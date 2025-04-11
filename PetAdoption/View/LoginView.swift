////
////  ContentView.swift
////  PetAdoption
////
////  Created by Goran Saric on 13.12.24.
////

import SwiftUI

struct LoginView: View {
    
    @State  var email: String = ""
    @State  var password: String = ""
    private var users = [
        (role: "Adopter", symbol: "person.fill"),
        (role: "Shelter", symbol: "house.fill")
    ]
    @State private var selectedUser: String = "Adopter"
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.cyan.opacity(0.8).ignoresSafeArea()
                VStack(spacing: 20) {
                    Spacer()
                    Text("Please Login")
                        .font(.title)
                        .fontDesign(.monospaced)
                        .padding()
                        .foregroundStyle(.white)
                    Image("cutedog")
                        .frame(width: 300, height: 150)
                        .padding(.leading, 35)
                        .padding(.top, 50)
                    Spacer()
                    
                    //Email view
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
                    .padding(.bottom)
                    
                    Divider()
                        .frame(width: 300, height: 2)
                        .background(Color.white)
                        
                    Text("Choose your account")
                        .font(.callout)
                        .foregroundStyle(.white)
                        .fontDesign(.monospaced)
                    
                    //Account picker view
                    Picker("Users", selection: $selectedUser){
                        ForEach(users, id: \.role){ user in
                            HStack(spacing: 10){
                                Image(systemName: user.symbol)
                                Text(user.role)
                                    
                            }
                        }
                    }
                    .frame(width: 300, height: 50)
                    .background(Color(.cyan).opacity(0.5))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .pickerStyle(MenuPickerStyle())
                    .tint(.white)
                    
                    
                    Text("Don't have account?")
                        .foregroundStyle(.white)
                        .fontDesign(.monospaced)
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign up")
                            .foregroundStyle(.white)
                            .fontDesign(.monospaced)
                           
                    }
                    Spacer()
                }
            }
        }
       
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
