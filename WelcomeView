//
//  WelcomeView.swift
//  Verdant
//
//  Created by Nickolas Stoyanov on 5/5/25.
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 40) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                    .frame(width: 150, height: 150)
                VStack {
                    
                    Image(systemName: "apple.meditate.circle")
                        .font(.system(size: 100))
                        .foregroundStyle(.green)
                    Text("Verdant")
                        .font(.custom("Futura", size: 30))
                }
            }
            Text("Welcome to Verdant!")
                .font(.custom("Futura", size: 20))
                .fontWeight(.bold)
            
            NavigationLink(destination: MapView()) {
                Text("Explore Nearby Eco Spots")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .frame(width: 300)
            }
        }
    }
}
