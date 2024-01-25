//
//  ContentView.swift
//  monApp
//
//  Created by Apprenant 87 on 29/10/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var vm = LocationsViewModel()
    @State private var selectedTab: Tab = .magnifyingglass
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    switch selectedTab {
                    case .magnifyingglass:
                        SearchBar()
                    case .map:
                        NavView()
                            .environmentObject(vm)
                    case .calendar:
                        CalView()
                    case .chart:
                        DataVizualisation()
                        }
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
