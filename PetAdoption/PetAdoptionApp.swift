//
//  PetAdoptionApp.swift
//  PetAdoption
//
//  Created by Goran Saric on 13.12.24.
//

import SwiftUI
import Firebase

@main
struct PetAdoptionApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
