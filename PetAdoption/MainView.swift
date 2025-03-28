//
//  ContentView.swift
//  PetAdoption
//
//  Created by Goran Saric on 13.12.24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack{

                Spacer()
                Text("Find your new best friend")
                    .font(.largeTitle)
                    .bold()
                
                Image("pets")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 550, height: 450)
                
                Spacer()
                Button {
                    
                } label: {
                    Text("Get Started")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.cyan)
                        .cornerRadius(25)
                        .shadow(radius: 10)
                        
                    
                }
                .padding(.top)
                Spacer()
                
            }
        }
        
        
    }
    
}
#Preview {
    MainView()
}
