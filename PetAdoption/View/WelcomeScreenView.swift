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
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("ADOPTLY")
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.top, 50)
                    
                    Image("pets")
//                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 550)
                        .padding(.bottom, -50)
                        .scaleEffect(pulsing ? 1.01 : 1)
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
                                .background(Color.cyan.opacity(0.8))
                                .cornerRadius(25)
                                .shadow(radius: 10)
                                
                    }
                    
                    .padding(.top, 75)
                    Spacer()
                   
//                    .padding(.top)
//                    .padding(.bottom, 50) // Add extra bottom padding if necessary
                    
                }
            }
            
           
            
        }
        
    }
}

#Preview {
    WelcomeScreenView()
}

