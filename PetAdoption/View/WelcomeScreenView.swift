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
    @State private var titleOpacity = 0.0
    @State private var subtitleOpacity = 0.0
    @State private var logoOpacity = 0.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()
                
                VStack {
                    Spacer()
                    // Main card background
                    RoundedRectangle(cornerRadius: 25)
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity, maxHeight: 450)
                        .padding(.horizontal, 56)
                        .shadow(color: .black, radius: 12)
                        .foregroundStyle(.white)
                        .scaleEffect(pulsing ? 1.0 : 1)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: pulsing)
                }
                
                VStack {
                    // Animated Title
                    Text("ADOPTLY")
                        .foregroundStyle(.white)
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .padding(.top)
                        .shadow(color: .black, radius: 15)
                        .opacity(titleOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1).delay(0.2)) {
                                titleOpacity = 1.0
                            }
                        }
                    Text("THE FUTURE OF PET CONNECTION")
                        .foregroundStyle(.white)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .padding(.top)
                        .shadow(color: .black, radius: 15)
                        .opacity(titleOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1).delay(0.2)) {
                                titleOpacity = 1.0
                            }
                        }
                    
                    // Logo image with fade-in and pulse animation
                    Image("pets")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 550)
                        .clipped()
                        .shadow(color: .black, radius: 10)
                        .scaleEffect(pulsing ? 1.02 : 1)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: pulsing)
                        .opacity(logoOpacity) // Add opacity for fade-in effect
                        .onAppear {
                            withAnimation(.easeIn(duration: 1).delay(0.4)) { // Fade-in delay for logo
                                logoOpacity = 1.0
                            }
                        }
                    
                    
                    Text("""
                        Meet your new bestie
                        at a shelter near you!
                        """)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(.blue)
                    .shadow(color: .black, radius: 0.4)

                    
                    Spacer()
                    
                    // Get Started Button without animation
                    NavigationLink(destination: IntroductionView()) {
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
