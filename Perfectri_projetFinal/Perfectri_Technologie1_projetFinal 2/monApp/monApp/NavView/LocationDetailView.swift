//
//  LocationDetailView.swift
//  monApp
//
//  Created by Apprenant 87 on 03/11/2022.
//

import SwiftUI

struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: LocationTri
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                                imageSection
                                VStack (alignment: .leading, spacing: 16) {
                                    VStack (alignment: .leading, spacing: 8) {
                                        Text(location.name)
                                            .font(.largeTitle)
                                        Text(location.adress)
                                        Spacer()
                                        HStack (alignment: .top, spacing: 8) {
                                            VStack (alignment: .trailing, spacing: 8){
                                                Text("Lundi :")
                                                Text("Mardi :")
                                                Text("Mercredi :")
                                                Text("Jeudi :")
                                                Text("Vendredi :")
                                                Text("Samedi :")
                                                Text("Dimanche :")
                                            }
                                            VStack (alignment: .leading, spacing: 8){
                                                ForEach(location.schedule, id: \.self) {
                                                    Text($0)
                                                }
                                            }
                                            
                                            VStack (alignment: .center, spacing: 20){
                                                ForEach(location.typeDechet, id: \.self) {
                                                    switch $0 {
                                                    case .ampoule:
                                                        Image(systemName: "lightbulb.fill")
                                                            .resizable()
                                                            .foregroundColor(.orange)
                                                            .scaledToFit()
                                                            .frame(height: 30)
                                                    case .pile:
                                                        Image(systemName: "battery.100")
                                                            .resizable()
                                                            .foregroundColor(.mint)
                                                            .scaledToFit()
                                                            .frame(height: 20)

                                                    case .vetement:
                                                        Image(systemName: "tshirt.fill")
                                                            .resizable()
                                                            .foregroundColor(.red)
                                                            .scaledToFit()
                                                            .frame(height: 30)
                                                    case .verre:
                                                        Image(systemName: "trash.fill")
                                                            .resizable()
                                                            .foregroundColor(.green)
                                                            .scaledToFit()
                                                            .frame(height: 30)
                                                    case .papier:
                                                        Image(systemName: "newspaper.fill")
                                                            .resizable()
                                                            .foregroundColor(.yellow)
                                                            .scaledToFit()
                                                            .frame(height: 30)
                                                    case .carton:
                                                        Image(systemName: "shippingbox.fill")
                                                            .resizable()
                                                            .foregroundColor(.brown)
                                                            .scaledToFit()
                                                            .frame(height: 30)
                                                    default:
                                                        Image("square.and.arrow.up")
                                                            .resizable()
                                                    }
                                                }
                                            }
                                            .padding(30)
                                            
                                        }
                                        .font(.subheadline.bold())
                                    }
                                    .padding()
                                }
                            }
                backButton
                    .offset(x: -150, y: -280)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationDataService.locations.first!)
    }
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView{
            ForEach(location.photo, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 400)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var scheduleSection: some View {
        TabView{
            ForEach(location.schedule, id: \.self) {
                Text($0)
//                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
             Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(30)
            
        }
    }
}
