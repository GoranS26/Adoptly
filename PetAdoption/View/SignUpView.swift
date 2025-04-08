//
//  SignUpView.swift
//  PetAdoption
//
//  Created by Goran Saric on 08.04.25.
//

import SwiftUI

struct SignUpView: View {
    
     @State private var signUpEmail: String = ""
     @State private var signUpPassword: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.cyan.opacity(0.8).ignoresSafeArea()
                VStack{
                    Spacer()
                    Text("Create new account")
                        .foregroundStyle(.white)
                        .fontDesign(.monospaced)
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                   Text("Which account would you like to make?")
                        .foregroundStyle(.white)
                        .fontDesign(.monospaced)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 100)
                        ZStack{
                            HStack(spacing: 35){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.cyan.opacity(0.5))
                                    .frame(width: 150, height: 150)
                                    .overlay {
                                        VStack{
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.white)
                                                .font(.title2)
                                            Text("Adopter")
                                                .foregroundStyle(.white)
                                                .fontDesign(.monospaced)
                                                .font(.title2)
                                                .padding(.bottom, 10)
                                        }
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 3)
                                    }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.cyan.opacity(0.5))
                                    .frame(width: 150, height: 150)
                                    .overlay {
                                        VStack{
                                            Image(systemName: "house.lodge.fill")
                                                .foregroundStyle(.white)
                                                .font(.title2)
                                            Text("Shelter")
                                                .foregroundStyle(.white)
                                                .fontDesign(.monospaced)
                                                .font(.title2)
                                                .padding(.bottom, 10)
                                        }
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 3)
                                    }
                            }
                        }
                    Spacer()
                    Text("Already have an account?")
                        .foregroundStyle(.white)
                        .fontDesign(.monospaced)
                    
                        .padding(.bottom)
                    NavigationLink(destination: LoginView()) {
                        Text("LOG IN")
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
    SignUpView()
}
