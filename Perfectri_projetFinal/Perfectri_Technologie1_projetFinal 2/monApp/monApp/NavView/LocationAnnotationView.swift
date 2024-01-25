//
//  LocationAnnotationView.swift
//  monApp
//
//  Created by Apprenant 87 on 03/11/2022.
//

import SwiftUI

struct LocationAnnotationView: View {
    
    let accentColor: Color = .mint
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 20, height: 20)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -6)
                .padding(.bottom, 50)
        }
    }
}

struct LocationAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LocationAnnotationView()
        }
        
    }
}
