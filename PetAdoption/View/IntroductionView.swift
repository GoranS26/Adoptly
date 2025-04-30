////////
////////  NavigationView.swift
////////  PetAdoption
////////
////////  Created by Goran Saric on 14.12.24.
////////
//////
//
//import SwiftUI
//
//
//struct IntroductionView: View {
//    @State private var selectedPage = 0
//    @State private var navigate = false
//    @State private var offset: CGFloat = 0
//    
//    
//    var body: some View {
//        NavigationStack{
//            ZStack {
//                Color.blue.opacity(0.8).ignoresSafeArea()
//                VStack {
////                    NavigationLink(destination: LoginView(), isActive: $navigate) {
////                        EmptyView()
////                    }
////                    .hidden()
//                    TabView(selection: $selectedPage) {
//                        VStack {
//                            Text("Welcome to Adoptly!")
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                                .padding(.bottom)
//                            //Small pet picture goes between
//                            Text("Browse pets from animal shelters around EU \nand find your new best friend anywhere in Austria")
//                                .multilineTextAlignment(.center)
//                                .font(.callout)
//                                .foregroundColor(.white)
//                        }
//                        .tag(0)
//
//                        VStack {
//                            Text("With just a few steps!")
//                            //Small pet picture goes between
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                                .padding(.bottom)
//                            Text("Type your location, \n shelter type, and search for your perfect pet")
//                                .font(.callout)
//                                .foregroundColor(.white)
//                                .multilineTextAlignment(.center)
//                        }
//                        .tag(1)
//                        
////                        ZStack {
////                            RoundedRectangle(cornerRadius: 50)
////                                .fill(Color.cyan.opacity(0.5))
////                                .frame(width: 250, height: 100)
////                                .overlay(
////                                    VStack(spacing: 10){
////                                        Text("Swipe me to start")
////                                            .font(.title2)
////                                            .fontWeight(.semibold)
////                                            .foregroundColor(.white)
////                                        Image(systemName: "arrow.backward")
////                                            .foregroundStyle(.white)
////                                    }
////                                )
////                                .offset(x: offset)
////                                .animation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true), value: offset)
////                                .onAppear {
////                                    offset = 20
////                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
////                                        offset = -20
////                                    }
////                                }
////                        }
////                        .tag(2)
////                        .gesture(
////                            DragGesture()
////                                .onEnded { value in
////                                    if value.translation.width < -100 {
////                                        navigate = true
////                                    }
////                                }
////                        )
//                        VStack{
//                            SlideButtonView(navigate: $navigate)
//                            NavigationLink(destination: LoginView(), isActive: $navigate){
//                                EmptyView()
//                            }
//                            .tag(2)
//                            Spacer()
//                        }
//                        
//                    }
//                    .tabViewStyle(.page)
//                    .indexViewStyle(.page(backgroundDisplayMode: .always))
//                    
//                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//struct PetSearchView: View {
//    var body: some View {
//        Text("Find Your Perfect Pet")
//            .font(.largeTitle)
//            .fontWeight(.bold)
//            .padding()
//            .navigationTitle("Pet Search")
//    }
//}
//
//#Preview {
//    IntroductionView()
//}
//
//
import SwiftUI

struct IntroductionView: View {
    @State private var selectedPage = 0
    @State private var navigate = false
    @State private var animateIcon = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()

                VStack {
                    TabView(selection: $selectedPage) {
                        introPageView(
                            title: "🐶 Welcome to Adoptly!",
                            subtitle: "Find your new best friend from shelters across Austria 🇦🇹",
                            icon: "heart.circle.fill",
                            iconColor: .pink
                        ).tag(0)

                        introPageView(
                            title: "📍 Easy Search!",
                            subtitle: "Use filters like location, age & size to find your perfect companion 🐾",
                            icon: "magnifyingglass.circle.fill",
                            iconColor: .yellow
                        ).tag(1)

                        introPageView(
                            title: "🛡️ Verified Shelters",
                            subtitle: "Only trusted & verified shelters are listed so you can feel safe ❤️",
                            icon: "checkmark.shield.fill",
                            iconColor: .green
                        ).tag(2)

                        introPageView(
                            title: "⭐ Save Favorites",
                            subtitle: "Not ready yet? Save your favorite pets and view them anytime.",
                            icon: "star.circle.fill",
                            iconColor: .orange
                        ).tag(3)
                        
                        VStack {
                            Spacer()
                            introPageView(
                                title: "🌍 Adopt, Don’t Shop",
                                subtitle: "Give shelter pets a second chance and make the world better 🐾",
                                icon: "globe.americas.fill",
                                iconColor: .teal
                            )
                            Spacer()
                            SlideButtonView(navigate: $navigate)
                                .padding(.bottom, 70)  // Adjusted to give more space

                            NavigationLink(destination: LoginView(), isActive: $navigate) {
                                EmptyView()
                            }
                        }
                        .padding(.top, 130)
                        .tag(4)
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .onChange(of: selectedPage) { _ in
                        animateIcon = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation(.easeOut(duration: 0.6)) {
                                animateIcon = true
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                animateIcon = true
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    func introPageView(title: String, subtitle: String, icon: String, iconColor: Color) -> some View {
        VStack(spacing: 25) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(iconColor)
                .scaleEffect(animateIcon ? 1.0 : 0.7)
                .opacity(animateIcon ? 1 : 0)
                .shadow(radius: 10)
                .animation(.interpolatingSpring(stiffness: 150, damping: 10), value: animateIcon)

            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .opacity(animateIcon ? 1 : 0)
                .offset(y: animateIcon ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.1), value: animateIcon)

            Text(subtitle)
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .opacity(animateIcon ? 1 : 0)
                .offset(y: animateIcon ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.2), value: animateIcon)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white.opacity(0.15))
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
        )
//        .padding(.horizontal)
    }
}

#Preview {
    IntroductionView()
}
