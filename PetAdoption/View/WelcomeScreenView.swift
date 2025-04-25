//
//  WelcomeScreenView.swift
//  PetAdoption
//
//  Created by Goran Saric on 14.12.24.
//

import SwiftUI

struct WelcomeScreenView: View {
    
    @State private var pulsing = false
    @State private var waveOffset: CGFloat = 10

    

    var body: some View {
        NavigationStack{
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 25)
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity, maxHeight: 420)
                        .padding(.horizontal, 56)
                        .shadow(color: .black, radius: 12)
                        .foregroundStyle(.white)
                        
                }
                VStack{
                    Text("ADOPTLY")
                        .foregroundStyle(.white)
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .padding(.top)
                        .shadow(color: .black, radius: 15)
                    
                    Image("pets")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 550)
                        .shadow(color: .black, radius: 10)
                    Text("""
                               Find your 
                         new best friend
                         """)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(.blue)
                    .shadow(color: .black, radius: 0.4)
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
                                .shadow(color: .black, radius: 5)
                    }
                    .padding(.top, 50)
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WelcomeScreenView()
}


