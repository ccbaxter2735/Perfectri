//
//  ModelFlashcard.swift
//  monApp
//
//  Created by Apprenant 87 on 30/10/2022.
//

import SwiftUI

enum dayWeek: String {
    case lundi = "Lun"
    case mardi = "Mar"
    case mercredi = "Mer"
    case jeudi = "Jeu"
    case vendredi = "Ven"
    case samedi = "Sam"
    case dimanche = "Dim"
}

struct WeekView: Identifiable {
    var id = UUID().uuidString
    var city: String
    var week: dayWeek
    var colorGarbage: Color
    var iconGarbage: String
    var nameGarbage: String
}

var dataGarbage: [WeekView] = [
    WeekView(city: "Houilles", week: .lundi, colorGarbage: .yellow, iconGarbage: "trash", nameGarbage: "Poubelle Recyclage"),
    WeekView(city: "Houilles", week: .mardi, colorGarbage: .gray, iconGarbage: "trash", nameGarbage: "Ordures ménagères"),
    WeekView(city: "Houilles", week: .mercredi, colorGarbage: .green, iconGarbage: "trash", nameGarbage: "Poubelle à verre"),
    WeekView(city: "Houilles", week: .jeudi, colorGarbage: .brown, iconGarbage: "leaf", nameGarbage: "Déchets végétaux"),
    WeekView(city: "Houilles", week: .vendredi, colorGarbage: .pink, iconGarbage: "sofa", nameGarbage: "Détendez-vous ;)")
]
