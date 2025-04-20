//
//  AdopterPovView.swift
//  PetAdoption
//
//  Created by Goran Saric on 20.04.25.
//

import SwiftUI

struct AdopterPovView: View {
    var body: some View {
        
        ZStack {
            Color.cyan.opacity(0.8).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Adopter POV")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("This is the Adopter POV view and it's still work in progress.")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
        
    }
}

#Preview {
    AdopterPovView()
}
