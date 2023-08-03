//
//  ApiModel.swift
//  Exchange
//
//  Created by askar on 24/7/23.
//

import Foundation

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

struct ExchangeRates: Codable {
    let id: Int
    let title: String
    let officialTitle: String
    let slug: String
    let websiteUrl: String
    let rates: [String: String]
}


