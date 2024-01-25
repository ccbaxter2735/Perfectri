//
//  ModelNavView.swift
//  monApp
//
//  Created by Apprenant 87 on 01/11/2022.
//

import MapKit
import SwiftUI

// differents type de déchets
enum TypeDechet: String {
    case pile = "Pile"
    case vert = "Déchets Verts"
    case ampoule = "Ampoule"
    case vetement = "Vêtement"
    case verre = "Verre"
    case carton = "Carton"
    case papier = "Papier"
    case nonRecyclable = "Non-recyclable"
}

// structure de points de tri
// pour etre equatable on doit verifier que deux locationTri ne soit pas égaux
struct LocationTri: Identifiable, Equatable {

    var id = UUID()
    var name: String
    var photo: [String]
    var adress: String
    var coordinate: CLLocationCoordinate2D
    var schedule: [String]
    var typeDechet: [TypeDechet]
    
//    Equatable lhs left hand side et rhs right hand side
    static func == (lhs: LocationTri, rhs: LocationTri) -> Bool {
        lhs.id == rhs.id
    }
}

//  structure de recherche par ville et type de déchets
struct ville {
    var name: String
    var colorPoubelle: Color
    var typeDechet: [TypeDechet]
    var detailDechet: String
}

//  La structure de mes différentes points de tri
class LocationDataService {
    
    
    static let locations: [LocationTri] = [
        LocationTri(name: "E.Leclerc Houilles", photo: ["E.Leclerc Houilles", "Accueil de la Mairie"], adress: "Espace Sarazin 95 Bd Jean Jaurès, 78800 Houilles", coordinate: CLLocationCoordinate2D(latitude: 48.921361, longitude: 2.198608), schedule: ["8:30 - 21:00","8:30 - 21:00","8:30 - 21:00","8:30 - 21:00","8:30 - 21:00","8:30 - 21:00", "Fermé"], typeDechet: [.pile, .verre, .ampoule]),
        LocationTri(name: "Auchan Supermarché Houilles", photo: ["Auchan Supermarché Houilles"], adress: "108 Bd Emile Zola, 78800 Houilles", coordinate: CLLocationCoordinate2D(latitude: 48.923102, longitude: 2.204686), schedule: ["8:30 - 21:00","8:30 - 21:00","8:30 - 21:00","8:30 - 21:00","8:30 - 21:00","8:30 - 21:00", "Fermé"], typeDechet: [.ampoule]),
        LocationTri(name: "Conteneur verre Houilles", photo: ["Conteneur verre Houilles"], adress: "2 Rue Jean Mermoz 78800 Houilles", coordinate: CLLocationCoordinate2D(latitude: 48.925673, longitude: 2.189886), schedule: ["0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59"], typeDechet: [.verre]),
        LocationTri(name: "La Vie Claire", photo: ["La Vie Claire"], adress: "9 Pl. Michelet, 78800 Houilles", coordinate: CLLocationCoordinate2D(latitude: 48.924463, longitude: 2.187819), schedule: ["9:30 - 19:30","9:30 - 19:30","9:30 - 19:30","9:30 - 19:30","9:30 - 19:30","9:30 - 19:30","Fermé"], typeDechet: [.ampoule, .pile]),
        LocationTri(name: "La décheterie", photo: ["La décheterie"], adress: "9 avenue Denis Papin, 94100 Saint-Maur-des-Fossés", coordinate: CLLocationCoordinate2D(latitude: 48.7940550, longitude: 2.4923790), schedule: ["9:30 - 18.30","9:30 - 18.30","9:30 - 18.30","9:30 - 18.30","9:30 - 18.30","9:30 - 18.30","Fermé",], typeDechet: [.pile, .vert, .carton, .papier]),
        LocationTri(name: "Accueil de la Mairie", photo: ["Accueil de la Mairie"], adress: "53 bis rue de Fontenay, Vincennes", coordinate: CLLocationCoordinate2D(latitude: 48.8477465, longitude: 2.4403082), schedule: ["9:30 - 18:30"], typeDechet: [.pile]),
        LocationTri(name: "Borne", photo: ["Borne"], adress: "195 rue de Fontenay, Vincennes", coordinate: CLLocationCoordinate2D(latitude: 48.8487312, longitude: 2.4282314), schedule: ["0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59"], typeDechet: [.vetement]),
        LocationTri(name: "Point de collecte emballage et papiers", photo: ["Point de collecte emballage et papiers"], adress: "6 rue Gaston Lauriau, 93100 Montreuil", coordinate: CLLocationCoordinate2D(latitude: 48.8605441, longitude: 2.4438126), schedule: ["0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59"], typeDechet: [.papier, .carton]),
        LocationTri(name: "Point de collecte emballage, papiers et verre", photo: ["Point de collecte emballage, papiers et verre"], adress: "1 rue des Docteurs Dejerine, Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8543467, longitude: 2.4119071), schedule: ["0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59"], typeDechet: [.verre, .papier, .carton]),
        LocationTri(name: "Point de collecte de piles", photo: ["Point de collecte de piles"], adress: "70 rue Paul Doumer, 78130 Les Mureaux", coordinate: CLLocationCoordinate2D(latitude: 48.9937853, longitude: 1.9100766), schedule: ["0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59","0:00 - 23:59"], typeDechet: [.pile])
    ]
}

struct Previews_ModelNavView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
