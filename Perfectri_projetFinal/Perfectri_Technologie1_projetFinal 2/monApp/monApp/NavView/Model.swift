//
//  Model.swift
//  monApp
//
//  Created by Apprenant 87 on 03/11/2022.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
//    tous les exemple de lieux
    @Published var locations: [LocationTri]
//    vue actuelle sur la map
    @Published var mapLocation: LocationTri {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
//    region visible à l'écran
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    
//    montrer la liste des localisations, false au debut pour pas qu'on la voit tous le temps
    @Published var showLocationsList: Bool = false
    
//    voir localisation par la carte
    @Published var sheetLocation: LocationTri? = nil
    
    init() {
        let locations = LocationDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: LocationTri) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinate, span: mapSpan)
        }
        
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: LocationTri) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
//        recuperer l'index actuel
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            print("ne peux pas trouver d'index dans le tableau des localisations")
            return
        }
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
//            pour verif l'index suivant est dispo sinon retour au premier index
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
//        next index est valide
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
