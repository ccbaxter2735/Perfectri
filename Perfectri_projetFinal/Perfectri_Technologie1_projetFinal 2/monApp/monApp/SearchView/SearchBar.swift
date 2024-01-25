//
//  SearchBar.swift
//  monApp
//
//  Created by Apprenant 87 on 30/10/2022.
//

import SwiftUI

struct SearchBar: View {
    
    var listOfProduct = productList
    @State var searchText = ""
    
    @State private var singleSelection: UUID?
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(producted) { product in
                        NavigationLink {
                            ProductDetailView(products: product)
                        } label: {
                            ProductRow(products: product)
                        }
                    }
                    
                }
                .searchable(text: $searchText, prompt: "Recherche produits : Jambon, crème, ... ")
//                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Image("Perf_B2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 35)
                                    
                            }
                        }
            }
        }
    }
    
    var producted: [Product] {
        if searchText.isEmpty {
            return listOfProduct
        } else {
            return listOfProduct.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // Création d'une vue détaillé d'un produit
    // Quand click sur une des cellules -> donne vue ProductDetailView
    struct ProductDetailView: View {
        var products : Product
        
        var body: some View {
            VStack (alignment: .center, spacing: 10){
                Image(products.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(products.name)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                Text(products.marque)
                    .font(.title2)
                List{
                    switch (products.emballage.count) {
                    case 3:
                        EmballageRow(products: products, x: 0)
                    case 6:
                        EmballageRow(products: products, x: 0)
                        EmballageRow(products: products, x: 3)
                    case 9:
                        EmballageRow(products: products, x: 0)
                        EmballageRow(products: products, x: 3)
                        EmballageRow(products: products, x: 6)
                    default:
                        EmballageRow(products: products, x: 0)
                    }
                }
            }
        }
    }
}
    
    struct EmballageRow: View {
        var products: Product
        var x: Int
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(products.emballage[x])
                            .font(.title3.bold())
                        Text(products.emballage[x + 1])
                            .font(.subheadline)
                        //                            .italic()
                    }
                    Spacer()
                    Image(products.emballage[x + 2])
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 30)
                        .padding(.horizontal)
//                        }
//                    }
                }
                .multilineTextAlignment(.leading)
            }
        }
    }
    
    // cellule custom de ma liste
    struct ProductRow: View {
        //variable pour accéder à ma struct produit
        var products: Product
        
        var body: some View {
            HStack {
                VStack (alignment: .leading, spacing: 10){
                    Text(products.name.capitalized)
                        .font(.title3.bold())
                    Text(products.marque.capitalized)
                        .font(.body)
                }
                
                Spacer()
                //          structure avec parametre image produit
                Image(products.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100)
                    .frame(maxHeight: 100)
            }
        }

}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
