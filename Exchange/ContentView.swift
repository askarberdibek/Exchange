//
//  ContentView.swift
//  Exchange
//
//  Created by askar on 19/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
            Button {
                fetchAverageCurrencyRates()
            } label: {
                Image(systemName: "key.icloud")
                    //.resizable()
                    .aspectRatio(contentMode: .fill)
                    .imageScale(.large)
            }
            .padding()
            Button(action: {makeAPIRequest()}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })

        }
        .padding()
    }
}

struct YesNoResponce: Codable{
    let answer: String
    let forced: Bool
    let image: URL
}

let yerOrNo = YesNoResponce.self

struct CurrencyRates {
    let buyUSD: String
    let sellUSD: String
    let buyEUR: String
    let sellEUR: String
    let buyRUB: String
    let sellRUB: String
    let buyKZT: String
    let sellKZT: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
