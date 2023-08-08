//
//  ExchangeApp.swift
//  Exchange
//
//  Created by askar on 19/7/23.
//

import SwiftUI
import Foundation


@main
struct ExchangeApp: App {
    let rates = CurrencyRates(buyUSD: "0.0", sellUSD: "0.0", buyEUR: "0.0", sellEUR: "0.0", buyRUB: "0.0", sellRUB: "0.0", buyKZT: "0.0", sellKZT: "0.0")
    var body: some Scene {
        WindowGroup {
            ContentView(rates: rates)
        }
    }
}



//MARK:  API: "Средние курсы валют"
/*
 Gошаговое объяснение того, что делает код:
 1. Определение URL-адреса API.
 2. Создание запроса к API, используя URLSession.
 3. Ожидание ответа от API.
 4. Разбор ответа как JSON.
 5. Извлечение курсов обмена валют из JSON и сохранение их в структуре CurrencyRates.
 6. Возврат структуры CurrencyRates вызывающему коду.
 */
func fetchAverageCurrencyRates(completion:  @escaping(CurrencyRates) -> Void) {
    // 1
    let urlString = "https://data.fx.kg/api/v1/average" // Оставлю для макроса
    guard let url = URL(string: urlString) else {
        print("Некорректный URL")
        return
    }
    // 2. Создание запроса к API, используя URLSession.
    var request = URLRequest(url: url)
    request.addValue("Bearer eGC1NbLTtU73kyoAH62L9G7i5dlU9MLrdYIcgsy4", forHTTPHeaderField: "Authorization")
    
    // 3. Ожидание ответа от API.
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
            return
        }
   // 4. Разбор ответа как JSON.
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
                        //5. Извлечение курсов обмена валют из JSON и сохранение их в структуре CurrencyRates.
                        //print("Средний курс USD: Покупка - \(currencyRates.buyUSD), Продажа - \(currencyRates.sellUSD)")
                        completion(currencyRates)
                    } // 6. Возврат структуры CurrencyRates вызывающему коду.
                }
            } catch {
                print("Ошибка при разборе JSON: \(error.localizedDescription)")
            }
        }
    }.resume()
}



