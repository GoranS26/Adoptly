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
                    AnimatedWave(yOffset: waveOffset)
                        .fill(.white)
                        .frame(height: 450)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .ignoresSafeArea(edges: .bottom)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                                waveOffset = 50
                            }
                        }
                }
//                .ignoresSafeArea(edges: .bottom)
                
                VStack{
                    Text("ADOPTLY")
                        .foregroundStyle(.white)
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .padding(.top)
                        .shadow(color: .black, radius: 5)
                    
                    Image("pets")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 550)
//                        .padding(.bottom, -60)
//                        .scaleEffect(pulsing ? 1.01 : 1)
//                        .animation(Animation.easeInOut(duration: 0.6)
//                                .repeatForever(autoreverses: true), value: pulsing)
//                        .onAppear {
//                            pulsing.toggle()
//                        }
                    
                    Text("""
                               Find your 
                         new best friend
                         """)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(.blue)
                    .shadow(color: .black, radius: 1)
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
                    .padding(.top, 75)
                    Spacer()
//                    .padding(.top)
//                    .padding(.bottom, 50) // Add extra bottom padding if necessary
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct AnimatedWave: Shape {
        
        var yOffset: CGFloat // controls the wave height
        
        // This makes the shape animatable
        var animatableData: CGFloat {
            get { yOffset }
            set { yOffset = newValue }
        }
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 100))
            
            
            path.addCurve(to: CGPoint(x: rect.width, y: 75 - yOffset),
                          control1: CGPoint(x: rect.width * 0.50, y: 50 - yOffset),
                          control2: CGPoint(x: rect.width * 0.75, y: 50 + yOffset))
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.closeSubpath()
            
            return path
        }
    }
}

#Preview {
    WelcomeScreenView()
}


