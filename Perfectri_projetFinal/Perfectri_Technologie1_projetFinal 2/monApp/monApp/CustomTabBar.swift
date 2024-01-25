//
//  CustomTabBar.swift
//  monApp
//
//  Created by Apprenant 87 on 01/11/2022.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case magnifyingglass = "magnifyingglass"
    case map = "map"
    case calendar = "calendar"
    case chart = "chart.bar"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
//    pour choisir l'icone
    private var fillImage: String {
        switch selectedTab {
        case .magnifyingglass:
            return "magnifyingglass"
        case .map:
            return "map"
        case .calendar:
            return "calendar"
        case .chart:
            return "chart.bar"
        }
    }
//    pour choisir la couleur par icone
    private var tabColor: Color {
        switch selectedTab {
        case .magnifyingglass:
            return .mint
        case .map:
            return .pink
        case .calendar:
            return .orange
        case .chart:
            return .yellow
        }
    }
//    pour le texte sous icone
    private var tabName: String {
        switch selectedTab {
        case .magnifyingglass:
            return "Recherche"
        case .map:
            return "Map"
        case .calendar:
            return "Calendrier"
        case .chart:
            return "Statistique"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) {tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
//                    permet de rendre l'icone selectionné plus grosse que les autres
                        .scaleEffect(selectedTab == tab ? 1.5 : 1.0)
                        .foregroundColor(selectedTab == tab ? tabColor : .gray)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
                
                
            }
            .frame(width: nil, height: 65)
//            permet d'avoir le fond de la tabbar gris translucide
            .background(.thinMaterial)
            .cornerRadius(30)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
//        la vue initiale sera tjs la barre de recherche de produit
        CustomTabBar(selectedTab: .constant(.magnifyingglass))
    }
}
