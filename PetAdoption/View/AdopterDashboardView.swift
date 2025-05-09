//
//  AdopterDashboardView.swift
//  PetAdoption
//
//  Created by Goran Saric on 04.05.25.
//

import SwiftUI

struct AdopterDashboardView: View {
    @State private var selectedBreed: String? = nil
    @State private var favorites: [UUID: Bool] = [:]

    private var availablePets: [Pet] {
        return [
            Pet(name: "Bella", breed: "Golden Retriever", age: "Age: 3", imageName: "golden_retriever"),
            Pet(name: "Charlie", breed: "Beagle", age: "Age: 5", imageName: "beagle"),
            Pet(name: "Luna", breed: "German Shepherd", age: "Age: 2", imageName: "german_shepard"),
            Pet(name: "Max", breed: "Bulldog", age: "Age: 4", imageName: "bulldog"),
            Pet(name: "Lucy", breed: "Poodle", age: "Age: 3", imageName: "poodle")
        ]
    }

    private var filteredPets: [Pet] {
        if let breed = selectedBreed, !breed.isEmpty {
            return availablePets.filter {
                $0.breed.lowercased().contains(breed.lowercased())
            }
        }
        return availablePets
    }

    let columns = [
        GridItem(.flexible(), spacing: 50),
        GridItem(.flexible(), spacing: 50)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()

                VStack {
                    Text("Welcome to the Dashboard")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top)

                    Text("Find your new furry friend!")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 10)

                    // Search Bar with All button
                    HStack {
                        Button(action: {
                            selectedBreed = nil
                        }) {
                            Text("All")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(selectedBreed == nil ? Color.white : Color.white.opacity(0.9))
                                .foregroundColor(.blue)
                                .clipShape(Capsule())
                        }

                        TextField("Search...", text: Binding(
                            get: { selectedBreed ?? "" },
                            set: { newValue in
                                selectedBreed = newValue.isEmpty ? nil : newValue
                            }
                        ))
                        .foregroundStyle(.blue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        
                    }
                    .padding(.bottom, 10)

                    // Grid of Pets
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(filteredPets) { pet in
                                ZStack(alignment: .topTrailing) {
                                    NavigationLink(destination: PetDetailView(pet: pet)) {
                                        VStack {
                                            Image(pet.imageName)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width:180, height: 200)
                                                .clipped()
                                                .cornerRadius(12)
                                                .padding(.bottom)

                                            Text(pet.name)
                                                .font(.headline)
                                                .foregroundColor(.white)

                                            Text(pet.breed)
                                                .font(.subheadline)
                                                .foregroundColor(.white.opacity(0.7))
                                            Text(pet.age)
                                                .font(.subheadline)
                                                .foregroundColor(.white.opacity(0.7))
                                        }
                                        .padding(.vertical)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.15)))
                                        .shadow(radius: 5)
                                    }

                                    // Favorite Button
                                    Button(action: {
                                        favorites[pet.id] = !(favorites[pet.id] ?? false)
                                    }) {
                                        Image(systemName: favorites[pet.id] ?? false ? "heart.fill" : "heart")
                                            .foregroundColor(.blue)
                                            .padding(7)
                                            .background(Color.white.opacity(0.9))
                                            .clipShape(Circle())
                                    }
                                    .animation(.easeInOut, value: favorites[pet.id])
                                }
                            }
                        }
//                        .padding()
//                        .clipped()
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 50)
                    .scrollIndicators(.hidden)
//                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PetDetailView: View {
    var pet: Pet

    var body: some View {
        VStack {
            Image(pet.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 300)
                .cornerRadius(15)

            Text(pet.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text(pet.breed)
                .font(.title2)
                .foregroundColor(.gray)
                
            
            Text(pet.age)
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.bottom, 20)

            Text("More information about \(pet.name) will go here.")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.horizontal)

            Spacer()
        }
        .navigationTitle(pet.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Pet: Identifiable {
    var id = UUID()
    var name: String
    var breed: String
    var age: String
    var imageName: String
}

#Preview {
    AdopterDashboardView()
}
