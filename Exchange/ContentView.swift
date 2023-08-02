//
//  ContentView.swift
//  Exchange
//
//  Created by askar on 19/7/23.
//

import SwiftUI

struct ContentView: View {
    @State public var rates: CurrencyRates
   // @State var banks: Banks
    var body: some View {
        TabView{
            AverageView(rates: rates)
                .tabItem {
                    Label("Средние курсы", systemImage: "dollarsign.circle.fill")
                }
            BankView()
                .tabItem {
                    Label("Банки", systemImage: "building.columns.circle.fill")
                }
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let rates = CurrencyRates(buyUSD: "0.0", sellUSD: "0.0", buyEUR: "0.0", sellEUR: "0.0", buyRUB: "0.0", sellRUB: "0.0", buyKZT: "0.0", sellKZT: "0.0")
//        let banks = Banks.self
//        
//        ContentView(rates: rates, banks: banks)
//    }
//}

//.padding()
//            Button(action: {makeAPIRequest()}, label: {
//                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//            })
