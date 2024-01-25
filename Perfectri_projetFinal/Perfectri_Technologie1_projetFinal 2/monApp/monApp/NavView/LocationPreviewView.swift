//
//  LocationPreviewView.swift
//  monApp
//
//  Created by Apprenant 87 on 03/11/2022.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    let location: LocationTri
    var body: some View {
        HStack (alignment: .bottom, spacing: 0){
            VStack (alignment: .leading, spacing: 16){
                imageSection
                titleSection
            }
            .padding(5)
            VStack (spacing: 8){
                infoButton
                nextButton

            }
        }
        .padding(20)
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(.thinMaterial)
            .offset(y: 65)
        )
        .cornerRadius(30)
        .offset(y: -50)
        
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            LocationPreviewView(location: LocationDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
        
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let photo = location.photo.first {
                Image(photo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
//        .background(.thinMaterial)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack (alignment: .leading, spacing: 4){
            Text(location.name)
                .font(.title2.bold())
            
            Text(location.adress)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var infoButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Infos")
                .font(.headline)
                .frame(width: 80, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Suivant")
                .font(.headline)
                .frame(width: 80, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
}

