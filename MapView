//
//  MapView.swift
//  Verdant
//
//  Created by Nickolas Stoyanov on 5/5/25.
//
import SwiftUI
import MapKit

struct EcoLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298), // Chicago
        span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
    )
    
    @State private var ecoLocations: [EcoLocation] = []
    @State private var search = ""
    
    let ecoKeywords = [
        "thrift", "recycle", "Drop-Off", "refill", "zero waste", "sustainable",
        "farmers market", "compost", "organic", "reuse", "bike repair", "co-op", "savers", "goodwill"
    ]

    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Search eco-friendly places...", text: $search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    searchNearbyEcoPlaces()
                }) {
                    Image(systemName: "magnifyingglass")
                        .padding(8)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            
            Map(coordinateRegion: $region, annotationItems: ecoLocations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    VStack {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.green)
                        Text(location.name)
                            .font(.caption2)
                            .foregroundColor(.green)
                    }
                }
            }
            //.ignoresSafeArea()
            .onAppear {
                searchNearbyEcoPlaces()
            }
        }
    }
    
    func searchNearbyEcoPlaces() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let items = response?.mapItems else { return }
            
            ecoLocations = items.compactMap { item in
                let name = item.name?.lowercased() ?? ""
                
                let isEco = ecoKeywords.contains { keyword in
                    name.contains(keyword)
                }
                if isEco {
                    return EcoLocation(
                        name: item.name ?? "Unknown",
                        coordinate: item.placemark.coordinate
                    )
                } else {
                    return nil
                }
            }
        }
    } //ChatGPT helped me build this code. It helped with how to search up keywords and how to search for these locations.
}
