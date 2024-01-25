//
//  ModelSearchBar.swift
//  monApp
//
//  Created by Apprenant 87 on 30/10/2022.
//

import SwiftUI

struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var marque: String
    var image: String
    var emballage: [String]
}

var productList = [
    Product(name: "Gnocchi à poêler", marque: "Lustucru", image: "gnocchi", emballage: ["Sachet plastique", "Non Recyclable", "poubelleGrise"]),
    Product(name: "Crème légère epaisse", marque: "Elle & Vire", image: "creme", emballage: ["Poche souple","Non Recyclable", "poubelleGrise","Bouchon", "Non Recyclable", "poubelleGrise"]),
    Product(name: "Activia vanille", marque: "Danone", image: "vanille", emballage: ["Etui carton","Recyclable","poubelleJaune","Opercule","Recyclable","poubelleJaune", "Pot plastique" ,"Recyclable","poubelleJaune",]),
    Product(name: "Rôti de poulet cuit 100% filet", marque: "Fleury Michon", image: "poulet", emballage: ["Barquette","Recyclable", "poubelleJaune", "Film Plastique", "Recyclable", "poubelleJaune"]),
    Product(name: "Grainéa - Figue", marque: "Marque repère", image: "grainea", emballage: ["étui carton", "Recyclable", "poubelleJaune", "sachet plastique","Non Recyclable","poubelleGrise"]),
    Product(name: "Le Supérieur - Jambon", marque: "Fleury Michon", image: "jambonFm", emballage: ["Barquette","Recyclable", "poubelleJaune","Film Plastique", "Recyclable", "poubelleJaune"]),
    Product(name: "Velouté Nature - Yaourt", marque: "Danone", image: "DanoneVelouteNature", emballage: ["Etui carton", "Recyclable","poubelleJaune","Opercule","Recyclable","poubelleJaune","Pot plastique","Recyclable","poubelleJaune"]),
    Product(name: "Canette Coca Cola", marque: "Coca Cola", image: "coca", emballage: ["Cannettes en Alluminium","Recyclable", "poubelleJaune", "Emballage carton", "Recyclable", "poubelleJaune"]),
    Product(name: "Tartare - Fromage à tartiner ", marque: "Tartare", image: "tartare", emballage: ["Opercule","Recyclable", "poubelleJaune","Pot", "Recyclable", "poubelleJaune"]),
    Product(name: "Vin Chateau LaPompe", marque: "Vin", image: "pinard", emballage: ["Bouteille en Verre", "Recyclable","poubelleVerte", "Bouchon en liege", "Non Recyclable","poubelleGrise","Bouchon en Plastique", "Recyclable","poubelleJaune"]),
    Product(name: "Yaourt - pot en verre", marque: "Yaourt", image: "potyaourtV", emballage: ["Opercule en Alluminium", "Recyclable", "poubelleJaune","Pot en verre","Recyclable","poubelleVerte"])
]


