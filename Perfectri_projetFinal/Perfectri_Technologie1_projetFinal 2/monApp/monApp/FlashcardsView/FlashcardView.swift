//
//  FlashcardView.swift
//  monApp
//
//  Created by Apprenant 87 on 30/10/2022.
//

import SwiftUI

struct CalView: View {
    //    titre du picker
    @State var pickerTitre: String = "Lun"
    @State var dataWeek: [WeekView] = dataGarbage
    
    var isJour: [WeekView] {
        switch pickerTitre {
        case "Lun":
            dataWeek = dataWeek.filter{$0.week == .lundi}
        case "Mar":
            dataWeek = dataWeek.filter{$0.week == .mardi}
        case "Mer":
            dataWeek = dataWeek.filter{$0.week == .mercredi}
        case "Jeu":
            dataWeek = dataWeek.filter{$0.week == .jeudi}
        default:
            dataWeek = dataWeek.filter{$0.week == .vendredi}
        }
        return dataWeek
    }
    
    var colorDaypicker: Color {
        switch pickerTitre {
        case "Lun":
            return .yellow
        case "Mar":
            return .gray
        case "Mer":
            return .green
        case "Jeu":
            return .brown
        default:
            return .pink
        }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {

                Picker(" ", selection: $pickerTitre) {
                    Text("Lun")
                        .tag("Lun")
                    Text("Mar")
                        .tag("Mar")
                    Text("Mer")
                        .tag("Mer")
                    Text("Jeu")
                        .tag("Jeu")
                    Text("Ven")
                        .tag("Ven")
                }
                .pickerStyle(.segmented)
                .foregroundColor(.white)
                .colorMultiply(colorDaypicker)
       
                Spacer()
                    .frame(height: 100)
                ForEach(dataWeek.filter{$0.week.rawValue == pickerTitre}) { week in
                    DisplayFlashcards(week: week)
                }
                
                
            }
            .navigationTitle("Semaine")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
    @ViewBuilder
    func DisplayFlashcards(week: WeekView) -> some View {
        FlashcardView (front: {
            FrontRow(week: week)
        }, back: {
            BackRow(jour: pickerTitre, week: week)
        })
    }
    
    struct FrontRow: View {
        var week: WeekView
        
        var body: some View {
            VStack (alignment: .center){
                Spacer()
                Image(systemName: week.iconGarbage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 120)
                    .foregroundColor(.white)
                
                Text(week.nameGarbage)
                    .padding(.top)
                    .padding()
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(week.colorGarbage)
//            .background(data.colorGarbage)
            .cornerRadius(20)
            .padding(20)
           
        }
    }
    
    struct BackRow: View {
        var jour: String
        var week: WeekView
        var body: some View {
            VStack(alignment:.leading){
                switch jour {
                case "Lun":
                    Group {
                        VStack(alignment: .leading) {
                            HStack {
                                Image("papiers")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40)
                                Text("Papiers")
                                    .font(.body.bold()).foregroundColor(.black)
                            }
                            
                            HStack {
                                Image("bidon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40);
                                Text("Emballages plastiques").font(.body).foregroundColor(.black)
                                    .bold()
                            }
                            
                            HStack {
                                Image("conserve")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40);
                                Text("Emballages en métal").font(.body).foregroundColor(.black)
                                    .bold()
                            }
                            
                            HStack {
                                Image("brique")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40);
                                Text("Briques en carton").font(.body).foregroundColor(.black)
                                    .bold()
                            }
                            HStack {
                                Image("bouteillePlastique")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 40);
                                Text("Bouteilles plastiques").font(.body.bold()).foregroundColor(.black)
                            }
                        }
                        .foregroundColor(.white)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .background(week.colorGarbage)
            //            .background(data.colorGarbage)
                        .cornerRadius(20)
                        .padding(20)
                    }
               
                case "Mar":
                    HStack {
                        Image("petitSacPoubelle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 40)
                            .padding()
                        Text("Tout ce qui ne va pas dans la boubelle jaune. Cartons usagers par exemple.")
                            .font(.body.bold())
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                    .foregroundColor(.white)
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                    .background(week.colorGarbage)
        //            .background(data.colorGarbage)
                    .cornerRadius(20)
                    .padding(20)
                case "Mer":
                    VStack(alignment: .leading) {
                        HStack {
                            Image("bouteilleEnVerre")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 40);
                            Text("Bouteilles en verre")
                                .font(.body.bold()).multilineTextAlignment(.leading)
                        }
                        
                        HStack {
                            Image("potEnVerre")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 40);
                            Text("Bocaux")
                                .font(.body.bold())
                                .multilineTextAlignment(.leading)
                        }
                        
                        Text("NB: Il ne doit pas y avoir de bouchons ou couvercles sur les objets que vous jetez.")
                            .padding()
                            .font(.body.bold())
                            .multilineTextAlignment(.leading)
                            .padding(.top, -2)
                    }
                    .foregroundColor(.white)
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                    .background(week.colorGarbage)
                    .cornerRadius(20)
                    .padding(20)
                    
                case "Jeu":
                    HStack {
//                        Image("compostLine")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 70, height: 70)
//                            .padding(10)
                        
                        Text("Attention, biodégradable ne signifie pas toujours compostable ! Aussi, la vaisselle biodégradable doit être jetée aux ordures ménagères car certains produits, selon leur composition, n’arrivent pas à être complètement dégradés.")
                            .padding(30)
                            .font(.body.bold())
                            .multilineTextAlignment(.leading)
                    }
                    .foregroundColor(.white)
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                    .background(week.colorGarbage)
        //            .background(data.colorGarbage)
                    .cornerRadius(20)
                    .padding(20)
                    
                    
                default:
                    Text("Il n'est pas nécessaire de laver les emballages avant de les jeter. Il suffit simplement de bien les vider. Laver les emballes necessite d'utiliser de l'eau qu'il faudra ensuite traiter. Ce qui n'est pas plus écologique.")
                        .padding(30)
                        .font(.body.bold())
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .background(week.colorGarbage)
            //            .background(data.colorGarbage)
                        .cornerRadius(20)
                        .padding(20)
                    
                }
            }
        }
    }
}


struct CalView_Previews: PreviewProvider {
    static var previews: some View {
        CalView()
    }
}
