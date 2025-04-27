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
                Color.blue.opacity(0.8).ignoresSafeArea()
                VStack(spacing: 20) {
                    Spacer()
                    Text("Who are you today")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .padding()
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 5)
                    
                    ZStack{
                        Image("cutedog")
                            .frame(width: 300, height: 150)
                            .padding(.leading, 35)
                            .padding(.top, 50)
                            .shadow(color: .black, radius: 5)
                        Divider()
                            .frame(width: .infinity, height: 5)
                            .background(Color.black)
                            .shadow(color: .black, radius: 5)
                            .padding(.top, 170)
                    }
                    
                    
                    Spacer()
                    //Email view
                    TextField("", text: $email, prompt:
                                Text("Enter your email").foregroundStyle(.white).fontDesign(.rounded).fontWeight(.bold))
                    .foregroundStyle(.white)
                    .padding()
                    .textContentType(.emailAddress)
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    
                    //Password view
                    SecureField("", text: $password, prompt:
                                    Text("Enter your password").foregroundStyle(.white).fontDesign(.rounded).fontWeight(.bold))
                    .padding()
                    .textContentType(.password)
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .foregroundStyle(.white)
                    Button {
                        
                        //Login logic needs to happen
                        
                    } label: {
                        Text("LOG IN".uppercased())
                                .font(.title3)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundStyle(.white)
                                .frame(width: 200, height: 50)
                                .cornerRadius(25)
                                .overlay(
                                    Capsule().stroke(Color.white, lineWidth: 2)
                                )
                    }

                    
                    
                    Divider()
                        .frame(width: 300, height: 2)
                        .background(Color.white)
                        
                    Text("Choose your account")
                        .font(.callout)
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                    
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
                    .clipShape(Capsule())
                    .overlay(
                        Capsule().stroke(Color.white, lineWidth: 2)
                    )
                    .pickerStyle(MenuPickerStyle())
                    .tint(.white)
                    
                    
                    Text("Don't have account?")
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign up")
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                           
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
