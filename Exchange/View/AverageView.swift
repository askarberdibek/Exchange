//
//  AverageView.swift
//  Exchange
//
//  Created by askar on 24/7/23.
//

import SwiftUI

struct AverageView: View{
    @State var rates: CurrencyRates

    var body: some View{
        VStack{
           
            Form {
                Section(header: Text("🇺🇸 Доллар США USD ")) {
                    Text("Покупка: \(rates.buyUSD)")
                    Text("Продажа: \(rates.sellUSD)")
                }
                Section(header: Text("🇪🇺 Евро EUR ")) {
                    Text("Покупка: \(rates.buyEUR)")
                    Text("Продажа: \(rates.sellEUR)")
                }
                Section(header: Text("🇷🇺 Российский рубль RUB ")) {
                    Text("Покупка: \(rates.buyRUB)")
                    Text("Продажа: \(rates.sellRUB)")
                }
                Section(header: Text("🇰🇿 Казахский тенге KZT ")) {
                    Text("Покупка: \(rates.buyKZT)")
                    Text("Продажа: \(rates.sellKZT)")
                }
            }
                
        }
        .onAppear{
            fetchAverageCurrencyRates{ currencyRates in
                rates.self = currencyRates
            }
            
            loadBanks { banks in
                if let banks = banks {
                    banksdata.self = banks // Присваиваем полученные банки переменной banksdata
                } else {
                    // Обработка ошибки, если не удалось получить данные
                }
            }

        }
    }
}


//struct AverageView_Previews: PreviewProvider {
//    static var previews: some View {
//        let rates = CurrencyRates(buyUSD: "0.0", sellUSD: "0.0", buyEUR: "0.0", sellEUR: "0.0", buyRUB: "0.0", sellRUB: "0.0", buyKZT: "0.0", sellKZT: "0.0")
//        AverageView(rates: rates)
//    }
//}
