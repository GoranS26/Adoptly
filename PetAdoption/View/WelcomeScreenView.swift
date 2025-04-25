//
//  WelcomeScreenView.swift
//  PetAdoption
//
//  Created by Goran Saric on 14.12.24.
//

import SwiftUI

struct WelcomeScreenView: View {
    
    @State private var pulsing = false
    

    var body: some View {
        NavigationStack{
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()
                VStack{
                    Image("background4")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                    ZStack{
                        Image("background4")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                    }
                }
                .padding(.trailing, 50)
                
                VStack{
                    Text("ADOPTLY")
                        .foregroundStyle(.white)
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .padding(.top)
                        .shadow(color: .black, radius: 2)
                    
                    Image("pets")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 550)
                        .padding(.bottom, -50)
                        .scaleEffect(pulsing ? 1.02 : 1)
                        .animation(Animation.easeInOut(duration: 0.6)
                                .repeatForever(autoreverses: true), value: pulsing)
                        .onAppear {
                            pulsing.toggle()
                        }
                    
                    Text("""
                               Find your 
                         new best friend
                         """)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    Spacer()
                    NavigationLink(destination: IntroductionView()){
                        Text("Get Started".uppercased())
                                .font(.title3)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 250, height: 50)
                                .background(Color.blue.opacity(0.9))
                                .cornerRadius(25)
                                .shadow(color: .black, radius: 10)
                                
                    }
                    .padding(.top, 75)
                    Spacer()
//                    .padding(.top)
//                    .padding(.bottom, 50) // Add extra bottom padding if necessary
                    
                }
            }
            
           
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WelcomeScreenView()
}

