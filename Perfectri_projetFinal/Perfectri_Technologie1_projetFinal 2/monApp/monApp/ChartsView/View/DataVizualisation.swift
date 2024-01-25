//
//  DataVizualisation.swift
//  monApp
//
//  Created by Apprenant 87 on 29/10/2022.
//

import SwiftUI
import Charts

struct DataVizualisation: View {
    //    integrer données
    //@State var colorDaypicker: Color
    @State var dataAnalyse: [DataView] = data
    @State var dataHab: [DataView] = DataHab
    
    //    titre du picker
    @State var pickerTitre: String = ""
    @State var color: Color = .gray
    //    pour afficher la barre verticale de suivi
    @State var ActiveItem: DataView?
    @State var plotWidth: Double = 0.0
    
    var colorDaypicker: Color {
         switch pickerTitre {
         case "Ménagères":
             return .gray
         case "Recyclable":
             return .yellow
         case "Verre":
             return .green
         case "Végétaux":
             return .brown
         default:
             return .brown
         }
     }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Picker(" ", selection: $pickerTitre) {
                    Text("Ménagères")
                        .tag("Ménagères")
                    Text("Recyclable")
                        .tag("Recyclable")
                    Text("Verre")
                        .tag("Verre")
                    Text("Végétaux")
                        .tag("Végétaux")
                }
                .colorMultiply(colorDaypicker)
                .pickerStyle(.segmented)
                .padding()
               
                
             
            }
            VStack {
                //                API graph
                VStack( spacing: 12) {
                    // title of 1st title for chart
                   Text("Évolution des déchets collectés")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        
//                    calcul total des déchets en gras
                    let totalValue = dataAnalyse.reduce(0.0) {
                        partialResult, item in item.tonnesDechets + partialResult
                    }
                    
                    //      mettre texte format milliers ex 10 000 -> 10k
                    HStack (alignment: .center, spacing: 20){
                        
                        Text(totalValue.stringFormat)
                            .font(.largeTitle.bold())
                        Spacer()
                        Text("Tonnes de déchets")
                            .font(.body)
                    }
                    AnimatedChart()
//                  espace entre deux tableaux à revoir !!!
//                    Spacer()
                    
                    // title of 2nd chart
                    Text("Évolution des déchets par habitants")
                         .font(.headline)
                         .fontWeight(.heavy)
                         .foregroundColor(.black)
                         .multilineTextAlignment(.center)
                    
                    
                    
        //                    calcul total des déchets en gras
                    let totalValue2 = dataHab.reduce(0.0) {
                        partialResult, item in item.tonnesDechets + partialResult
                    }
                                        
                //      mettre texte format milliers ex 10 000 -> 10k
                            HStack (alignment: .center, spacing: 20){
                            Text(totalValue2.stringFormat)
                            .font(.largeTitle.bold())
                             Spacer()
                            Text("Tonnes de déchets")
                            .font(.body)
                                        }
                    
                    
                    animatedChart2()
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white.shadow(.drop(radius: 2)))
                }
                
            }
            .navigationTitle("Statistiques")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            
            
               
            //            mettre les données a jour en fonction de la segmented bar
            .onChange(of: pickerTitre) {
                newValue in dataAnalyse = data
                switch newValue {
                case "Ménagères":
                    dataAnalyse = dataAnalyse.filter{$0.typeDechets == .menagere}
                    color = .gray
                case "Verre":
                    dataAnalyse = dataAnalyse.filter{$0.typeDechets == .verre}
                    color = .green
                case "Recyclable":
                    dataAnalyse = dataAnalyse.filter{$0.typeDechets == .recyclable}
                    color = .yellow
                case "Végétaux":
                    dataAnalyse = dataAnalyse.filter{$0.typeDechets == .vegetaux}
                    color = .brown
                default:
                    dataAnalyse = dataAnalyse
                }
                animateGraph(fromChange: true)
            }
                
            .onChange(of: pickerTitre) {
                newValue2 in dataHab = DataHab
                switch newValue2 {
                case "Ménagères":
                    dataHab = dataHab.filter{$0.typeDechets == .menagere}
                    color = .gray
                case "Verre":
                    dataHab = dataHab.filter{$0.typeDechets == .verre}
                    color = .green
                case "Recyclable":
                    dataHab = dataHab.filter{$0.typeDechets == .recyclable}
                    color = .yellow
                case "Végétaux":
                    dataHab = dataHab.filter{$0.typeDechets == .vegetaux}
                    color = .brown
                default:
                    dataHab = dataHab
                }
                animateGraph2(fromChange: true)
            }
        }
    }
    
    @ViewBuilder
    func AnimatedChart() -> some View {
        
        // ------------------ Chart 1 ----------------------
        
        
        Chart {
            ForEach(dataAnalyse) { item in
                BarMark(
                    x: .value("Année", item.years),
                    y: .value("Tonnes déchets", item.animate ? item.tonnesDechets : 0)
                )
                .foregroundStyle(color.gradient)
                if let ActiveItem,ActiveItem.id == item.id {
                    RuleMark(x: .value("Année", ActiveItem.years))
                    
                    //                    type de ligne vertical
                        .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                    
                    //                    mettre la barre au centre de la WidthBar
                        .offset(x: (plotWidth / CGFloat(dataAnalyse.count)) / 2)
                    
                    //                    type de l'annotation
                        .annotation(position: .top) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("T de déchets")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(ActiveItem.tonnesDechets.stringFormat)
                                    .font(.title3.bold())
                            }
                            .padding(.horizontal,10)
                            .padding(.vertical,4)
                            .background {
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .fill(.white.shadow(.drop(radius: 2)))
                            }
                        }
                }
            }
        }
        .chartOverlay(content: { proxy in
            GeometryReader{ innerProxy in
                Rectangle()
                    .fill(.clear).contentShape(Rectangle())
                //                    .gesture(
                //
                //                    )
            }
        }
        )
        .frame(height: 150)
        //       parametre de l'animation temps d'apparition etc
        .onAppear {
            animateGraph()
        }
    }
    
    // ---------------------- chart 2 ----------------------
    
    func animatedChart2() -> some View {
        
        Chart {
            ForEach(dataHab) { item in
                BarMark(
                    x: .value("Année", item.years),
                    y: .value("Tonnes déchets", item.animate ? item.tonnesDechets : 0)
                )
                .foregroundStyle(color.gradient)
                if let ActiveItem,ActiveItem.id == item.id {
                    RuleMark(x: .value("Année", ActiveItem.years))
                    
                    //                    type de ligne vertical
                        .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                    
                    //                    mettre la barre au centre de la WidthBar
                        .offset(x: (plotWidth / CGFloat(dataHab.count)) / 2)
                    
                    //                    type de l'annotation
                        .annotation(position: .top) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("T de déchets")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(ActiveItem.tonnesDechets.stringFormat)
                                    .font(.title3.bold())
                            }
                            .padding(.horizontal,10)
                            .padding(.vertical,4)
                            .background {
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .fill(.white.shadow(.drop(radius: 2)))
                            }
                        }
                }
            }
        }
        //      adapter Y axe
        //        .chartYScale(domain: 50000...100000)
        //        visualisation des valeurs par le touché
        .chartOverlay(content: { proxy in
            GeometryReader{ innerProxy in
                Rectangle()
                    .fill(.clear).contentShape(Rectangle())
                //                    .gesture(
                //
                //                    )
            }
        }
        )
        .frame(height: 150)
        //       parametre de l'animation temps d'apparition etc
        .onAppear {
            animateGraph2()
        }
    }
    
    
    
    //    graphe animé grap1
    func animateGraph(fromChange: Bool = false) {
        for (index,_) in dataAnalyse.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (fromChange ? 0.03 : 0.05)) {
                withAnimation(fromChange ? .easeInOut(duration: 0.8) : .interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)) {
                    dataAnalyse[index].animate = true
                }
            }
        }
    }
    
    //    graphe animé grap2
    func animateGraph2(fromChange: Bool = false) {
        for (index,_) in dataHab.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (fromChange ? 0.03 : 0.05)) {
                withAnimation(fromChange ? .easeInOut(duration: 0.8) : .interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)) {
                    dataHab[index].animate = true
                }
            }
        }
    }
    
    
}

struct DataVizualisation_Previews: PreviewProvider {
    static var previews: some View {
        DataVizualisation()
    }
}

// extension pour convertir Double en String
extension Double {
    var stringFormat: String {
        if self > 1000 && self < 999999 {
            return String(format: "%.1fk", self / 1000).replacingOccurrences(of: ".0", with: "")
        }
        return String(format: "%.0f", self)
    }
}
