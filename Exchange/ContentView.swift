//
//  ContentView.swift
//  Exchange
//
//  Created by askar on 19/7/23.
//

import SwiftUI

struct ContentView: View {
    @State public var rates: CurrencyRates
    var body: some View {
        VStack {
            Text("Здесь будет время последнего запроса")

            Form {
                Section(header: Text("USD")) {
                    Text("Покупка: \(rates.buyUSD)")
                    Text("Продажа: \(rates.sellUSD)")
                }
                Section(header: Text("EUR")) {
                    Text("Покупка: \(rates.buyEUR)")
                    Text("Продажа: \(rates.sellEUR)")
                }
                Section(header: Text("RUB")) {
                    Text("Покупка: \(rates.buyRUB)")
                    Text("Продажа: \(rates.sellRUB)")
                }
                Section(header: Text("KZT")) {
                    Text("Покупка: \(rates.buyKZT)")
                    Text("Продажа: \(rates.sellKZT)")
                }
            }
            
            Button {
                fetchAverageCurrencyRates{ currencyRates in
                    rates.self = currencyRates
                }
            } label: {
                Image(systemName: "key.icloud")
                    .aspectRatio(contentMode: .fill)
                    .imageScale(.large)
            }
            .padding()
//            Button(action: {makeAPIRequest()}, label: {
//                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//            })

        }
        //.padding()
    }
}

struct CurrencyRates {
    var buyUSD: String = "00.0"
    var sellUSD: String = "00.0"
    var buyEUR: String = "00.0"
    var sellEUR: String = "00.0"
    var buyRUB: String = "00.0"
    var sellRUB: String = "00.0"
    var buyKZT: String = "00.0"
    var sellKZT: String = "00.0"
    
    init(buyUSD: String, sellUSD: String, buyEUR: String, sellEUR: String, buyRUB: String, sellRUB: String, buyKZT: String, sellKZT: String) {
        self.buyUSD = buyUSD
        self.sellUSD = sellUSD
        self.buyEUR = buyEUR
        self.sellEUR = sellEUR
        self.buyRUB = buyRUB
        self.sellRUB = sellRUB
        self.buyKZT = buyKZT
        self.sellKZT = sellKZT
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let rates = CurrencyRates(buyUSD: "0.0", sellUSD: "0.0", buyEUR: "0.0", sellEUR: "0.0", buyRUB: "0.0", sellRUB: "0.0", buyKZT: "0.0", sellKZT: "0.0")
        ContentView(rates: rates)
    }
}
