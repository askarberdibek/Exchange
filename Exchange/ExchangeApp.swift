//
//  ExchangeApp.swift
//  Exchange
//
//  Created by askar on 19/7/23.
//

import SwiftUI

@main
struct ExchangeApp: App {
    let rates = CurrencyRates(buyUSD: "0.0", sellUSD: "0.0", buyEUR: "0.0", sellEUR: "0.0", buyRUB: "0.0", sellRUB: "0.0", buyKZT: "0.0", sellKZT: "0.0")
    var body: some Scene {
        WindowGroup {
            ContentView(rates: rates)
        }
    }
}

var currencyRates = CurrencyRates.self

func fetchAverageCurrencyRates(completion:  @escaping(CurrencyRates) -> Void) {
    let urlString = "https://data.fx.kg/api/v1/average"
    guard let url = URL(string: urlString) else {
        print("Некорректный URL")
        return
    }
    
    var request = URLRequest(url: url)
    request.addValue("Bearer eGC1NbLTtU73kyoAH62L9G7i5dlU9MLrdYIcgsy4", forHTTPHeaderField: "Authorization")
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
            return
        }
        
        if let data = data {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let buyUSD = json["buy_usd"] as? String,
                       let sellUSD = json["sell_usd"] as? String,
                       let buyEUR = json["buy_eur"] as? String,
                       let sellEUR = json["sell_eur"] as? String,
                       let buyRUB = json["buy_rub"] as? String,
                       let sellRUB = json["sell_rub"] as? String,
                       let buyKZT = json["buy_kzt"] as? String,
                       let sellKZT = json["sell_kzt"] as? String {
                        let currencyRates = CurrencyRates(buyUSD: buyUSD, sellUSD: sellUSD, buyEUR: buyEUR, sellEUR: sellEUR, buyRUB: buyRUB, sellRUB: sellRUB, buyKZT: buyKZT, sellKZT: sellKZT)
                        
                        // Теперь у вас есть структура с данными, которые можно использовать в вашем приложении
                        //print("Средний курс USD: Покупка - \(currencyRates.buyUSD), Продажа - \(currencyRates.sellUSD)")
                        completion(currencyRates)
                    }
                }
            } catch {
                print("Ошибка при разборе JSON: \(error.localizedDescription)")
            }
        }
    }.resume()
}

func makeAPIRequest() {
    let urlString = "https://data.fx.kg/api/v1/average" // Замените на URL вашего API
    guard let url = URL(string: urlString) else {
        print("Некорректный URL")
        return
    }

    var request = URLRequest(url: url)
    request.addValue("Bearer eGC1NbLTtU73kyoAH62L9G7i5dlU9MLrdYIcgsy4", forHTTPHeaderField: "Authorization")

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
            return
        }

        if data != nil {
            // Обработка дValue 'data' was defined but never used; consider replacing with boolean testанных ответа API
        }
    }.resume()
}


