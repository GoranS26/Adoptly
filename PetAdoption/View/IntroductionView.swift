//////
//////  NavigationView.swift
//////  PetAdoption
//////
//////  Created by Goran Saric on 14.12.24.
//////
////

import SwiftUI


struct IntroductionView: View {
    @State private var selectedPage = 0
    @State private var navigate = false
    @State private var offset: CGFloat = 0
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.cyan.opacity(0.8).ignoresSafeArea()
                VStack {
                    NavigationLink(destination: LoginView(), isActive: $navigate) {
                        EmptyView()
                    }
                    .hidden()
                    TabView(selection: $selectedPage) {
                        VStack {
                            Text("Welcome to Adoptly!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom)
                            //Small pet picture goes between
                            Text("Browse pets from animal shelters around Austria and EU and find your \n new best friend anywhere in Austria")
                                .multilineTextAlignment(.center)
                                .font(.callout)
                                .foregroundColor(.white)
                        }
                        .tag(0)

                        VStack {
                            Text("With just a few steps!")
                            //Small pet picture goes between
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("Type your location, \n shelter type, and search for your perfect pet")
                                .font(.callout)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        .tag(1)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color.cyan.opacity(0.5))
                                .frame(width: 250, height: 100)
                                .overlay(
                                    VStack(spacing: 10){
                                        Text("Swipe me to start")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        Image(systemName: "arrow.backward")
                                            .foregroundStyle(.white)
                                    }
                                )
                                .offset(x: offset)
                                .animation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true), value: offset)
                                .onAppear {
                                    offset = 20
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        offset = -20
                                    }
                                }
                        }
                        .tag(2)
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    if value.translation.width < -100 {
                                        navigate = true
                                    }
                                }
                        )
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .frame(height: 250)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PetSearchView: View {
    var body: some View {
        Text("Find Your Perfect Pet")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
            .navigationTitle("Pet Search")
    }
}

#Preview {
    IntroductionView()
}


