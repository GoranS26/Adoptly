////
////  ContentView.swift
////  PetAdoption
////
////  Created by Goran Saric on 13.12.24.
////

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    private var users = [
        (role: "Adopter", symbol: "person.fill"),
        (role: "Shelter", symbol: "house.fill")
    ]
    @State private var selectedUser: String = "Adopter"
    @State private var loginError: String?
    @State private var showAlert = false
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()
                VStack(spacing: 20) {
                    Spacer()
                    Text("Ready for a new friend?")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .padding()
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 5)

                    ZStack {
                        Image("cutedog")
                            .frame(width: 300, height: 150)
                            .padding(.leading, 35)
                            .padding(.top, 52)
                            .shadow(color: .black, radius: 5)
                        Divider()
                            .frame(width: .infinity, height: 5)
                            .background(Color.black)
                            .shadow(color: .black, radius: 5)
                            .padding(.top, 170)
                    }

                    Spacer()

                    TextField("", text: $email, prompt:
                        Text("Enter your email")
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                            
                    )
                    .autocapitalization(.none)
                    .foregroundStyle(.white)
                    .padding()
                    .textContentType(.emailAddress)
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))

                    SecureField("", text: $password, prompt:
                        Text("Enter your password")
                            
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                            
                    )
                    .autocapitalization(.none)
                    .padding()
                    .textContentType(.password)
                    .frame(width: 300, height: 50)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    .foregroundStyle(.white)

                    // Navigation Trigger
                    NavigationLink(destination: AdopterDashboardView(), isActive: $isLoggedIn) {
                        EmptyView()
                    }

                    // Login Button using AuthService
                    Button {
                        AuthService.shared.login(email: email, password: password) { result in
                            switch result {
                            case .success(let user):
                                // Login was successful, handle user object if necessary
                                print("Logged in as \(user.email ?? "Unknown")")
                                isLoggedIn = true
                            case .failure(let error):
                                // Handle error
                                loginError = error.localizedDescription
                                showAlert = true
                            }
                        }
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

                    .alert("Login Error", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text(loginError ?? "Unknown error")
                    }

                    Divider()
                        .frame(width: 300, height: 2)
                        .background(Color.white)

                    Text("Don't have account?")
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)

                    NavigationLink(destination: AdopterSignUpView()) {
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

