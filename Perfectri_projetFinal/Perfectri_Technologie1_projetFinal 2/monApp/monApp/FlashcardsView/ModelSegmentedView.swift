//
//  ModelSegmentedView.swift
//  monApp
//
//  Created by Apprenant 87 on 02/11/2022.
//

import SwiftUI

struct Visualisation: View {
    var body: some View {
        FlashcardView (front: {
            Text("perfectri")
        }, back: {
            Text("Back")
        })

    }
}

struct FlashcardView<Front, Back>: View where Front: View, Back: View{
    
    var front: () -> Front
    var back: () -> Back
    var data: WeekView

    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0
//    pour retourner le texte back qui se retrouve a l'envers à cause de flashcard rotation
    @State var contentRotation = 0.0
    
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back) {
        self.front = front
        self.back = back
        self.data = WeekView(city: "", week: .vendredi, colorGarbage: .brown, iconGarbage: "heart", nameGarbage: "Detendez-Vous")
        
    }
    var body: some View {
        ZStack {
            if flipped {
                back()
            } else {
                front()
            }
        }
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
//        .frame(height: 300)
//        .frame(maxWidth: .infinity)
//        .background(data.colorGarbage)
//        .cornerRadius(20)
//        .padding(20)
        .onTapGesture {
            flipFlashcard()
        }
//        effet de rotation en fonction de l'axe Y -> y: 1 sur l'axe X -> x: 1
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
    }
    
    func flipFlashcard() {
//      temps de l'animation timeflip
        let timeFlip = 0.8
//      retourne la carte
        withAnimation(Animation.linear(duration: timeFlip)) {
            flashcardRotation += 180
        }
//      retourne le contenu "back" de la carte
        withAnimation(Animation.linear(duration: 0.001).delay(timeFlip / 2)) {
            contentRotation += 180
            flipped.toggle()
        }
        
    }
}

struct Visualisation_Previews: PreviewProvider {
    static var previews: some View {
        Visualisation()
    }
}
