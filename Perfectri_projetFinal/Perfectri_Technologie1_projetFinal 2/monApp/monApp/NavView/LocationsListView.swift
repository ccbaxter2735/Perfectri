//
//  LocationsListView.swift
//  monApp
//
//  Created by Apprenant 87 on 03/11/2022.
//

import SwiftUI

struct LocationsListView: View {
//    on crée la liste deroulante qui apparaitra sous le champs de recherche
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
//                pour colorier le background de la liste
                .listRowBackground(Color.clear)
                
                    
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView().environmentObject(LocationsViewModel())
    }
}

extension LocationsListView {
    private func listRowView(location: LocationTri) -> some View{
        HStack {
            if let photo = location.photo.first {
                Image(photo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack (alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.adress)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}
