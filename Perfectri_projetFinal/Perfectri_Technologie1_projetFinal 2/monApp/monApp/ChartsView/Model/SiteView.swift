//
//  SiteView.swift
//  monApp
//
//  Created by Apprenant 87 on 29/10/2022.
//

import SwiftUI

// Modèle de données

enum TypeDechets: String {
    case menagere = "Ordures ménagères"
    case verre = "Verre"
    case vegetaux = "Déchets végétaux"
    case recyclable = "Emballage et papiers"
}

struct DataView: Identifiable {
    var id = UUID().uuidString
    var years: String
    var typeDechets: TypeDechets
    var tonnesDechets: Double
    var animate: Bool = false
}

var data: [DataView] = [
    DataView(years: "2017", typeDechets: .menagere, tonnesDechets: 89_939),
    DataView(years: "2018", typeDechets: .menagere, tonnesDechets: 88_252),
    DataView(years: "2019", typeDechets: .menagere, tonnesDechets: 85_602),
    DataView(years: "2020", typeDechets: .menagere, tonnesDechets: 83_591),
    DataView(years: "2017", typeDechets: .recyclable, tonnesDechets: 13_160),
    DataView(years: "2018", typeDechets: .recyclable, tonnesDechets: 12_952),
    DataView(years: "2019", typeDechets: .recyclable, tonnesDechets: 13_119),
    DataView(years: "2020", typeDechets: .recyclable, tonnesDechets: 14_427),
    DataView(years: "2017", typeDechets: .verre, tonnesDechets: 8_029),
    DataView(years: "2018", typeDechets: .verre, tonnesDechets: 7_844),
    DataView(years: "2019", typeDechets: .verre, tonnesDechets: 7_792),
    DataView(years: "2020", typeDechets: .verre, tonnesDechets: 8_380),
    DataView(years: "2017", typeDechets: .vegetaux, tonnesDechets: 12_297),
    DataView(years: "2018", typeDechets: .vegetaux, tonnesDechets: 11_750),
    DataView(years: "2019", typeDechets: .vegetaux, tonnesDechets: 12_919),
    DataView(years: "2020", typeDechets: .vegetaux, tonnesDechets: 11_442)
]

var DataHab: [DataView] = [
    DataView(years: "2017", typeDechets: .menagere, tonnesDechets: 269),
    DataView(years: "2018", typeDechets: .menagere, tonnesDechets: 264),
    DataView(years: "2019", typeDechets: .menagere, tonnesDechets: 257),
    DataView(years: "2020", typeDechets: .menagere, tonnesDechets: 251),
    DataView(years: "2017", typeDechets: .recyclable, tonnesDechets: 39),
    DataView(years: "2018", typeDechets: .recyclable, tonnesDechets: 39),
    DataView(years: "2019", typeDechets: .recyclable, tonnesDechets: 39),
    DataView(years: "2020", typeDechets: .recyclable, tonnesDechets: 43),
    DataView(years: "2017", typeDechets: .verre, tonnesDechets: 24),
    DataView(years: "2018", typeDechets: .verre, tonnesDechets: 23),
    DataView(years: "2019", typeDechets: .verre, tonnesDechets: 23),
    DataView(years: "2020", typeDechets: .verre, tonnesDechets: 25),
    DataView(years: "2017", typeDechets: .vegetaux, tonnesDechets: 37),
    DataView(years: "2018", typeDechets: .vegetaux, tonnesDechets: 35),
    DataView(years: "2019", typeDechets: .vegetaux, tonnesDechets: 39),
    DataView(years: "2020", typeDechets: .vegetaux, tonnesDechets: 34)
]
