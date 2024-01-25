//
//  NavView.swift
//  monApp
//
//  Created by Apprenant 87 on 01/11/2022.
//

import SwiftUI
import MapKit

struct NavView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            VStack (spacing: 0){
                header
//                    .padding()
                Spacer()
//                    .frame(maxHeight: 280)
                locationsPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
            .environmentObject(LocationsViewModel())
    }
}

extension NavView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name)
                    .font(.title2.bold())
                    .foregroundColor(.black)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
//                        permettre à la fleche de tourner
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
//            on appelle ici l'extension de LocationListView pour avoir la liste qui s'affiche
            if vm.showLocationsList {
                LocationsListView()
            }
            
        }
        //            gris translucide
        .background(.thickMaterial)
        //                .cornerRadius(25)
//        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        //          partie carte avec resultat de recherche
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinate) {
                LocationAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1.1 : 0.6)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                    //                            .shadow(color: .black.opacity(0.3), radius: 10)
                        .padding(5)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}


