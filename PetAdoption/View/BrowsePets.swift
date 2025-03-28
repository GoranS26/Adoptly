//
//  BrowsePets.swift
//  PetAdoption
//
//  Created by Goran Saric on 07.02.25.
//

import SwiftUI

struct BrowsePets: View {
    
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack {
            Color.cyan.opacity(0.9)
                .ignoresSafeArea()
            VStack {
                TextField("Browse Pets", text: $searchText)
                    .padding()
                    .border(Color.black)
                    .background(Color.gray.opacity(0.6))
                    .frame(width: 300, height: 150)
                    .foregroundStyle(.white)
                    
                
            }
            
        }
       
    }
    
}

#Preview {
    BrowsePets()
}


