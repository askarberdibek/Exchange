import Foundation

struct Bank: Codable {
    let id: Int
    let title: String
    let official_title: String
    let slug: String
    let website_url: URL
    let rates: [ExchangeRate]
}

struct ExchangeRate: Codable {
    //let organization_id: Int
    //let base_currency_id: Int
    let created_at: String
    let updated_at: String
    let is_current: Int
    let type: String
    let buy_usd: String
    let sell_usd: String
    let buy_eur: String
    let sell_eur: String
    let buy_rub: String
    let sell_rub: String
    let buy_kzt: String
    let sell_kzt: String
    let buy_uzs: String?
    let sell_uzs: String?
    let buy_cny: String?
    let sell_cny: String?
    let buy_gbp: String?
    let sell_gbp: String?
    let buy_try: String?
    let sell_try: String?
}

struct Banks: Decodable, Identifiable{
    var id: Int
    var title: String
    var official_title: String
    var slug: String
    var website_url: String
    var rates: [Rates]
}

struct Rates: Decodable, Identifiable{
    var id: Int
    var organization_id: Int
    var base_currency_id: Int
    var created_at: String
    var updated_at: String
    var is_current: Int
    var type: String
    var buy_usd: String
    var sell_usd: String
    var buy_eur: String
    var sell_eur: String
    var buy_rub: String
    var sell_rub: String
    var buy_kzt: String
    var sell_kzt: String
    var buy_uzs: String?
    var sell_uzs: String?
    var buy_cny: String?
    var sell_cny: String?
    var buy_gbp: String?
    var sell_gbp: String?
    var buy_try: String?
    var sell_try: String?
}

var banksdata: [Banks] = []
