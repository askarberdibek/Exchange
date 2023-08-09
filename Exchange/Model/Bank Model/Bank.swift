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
    let organization_id: Int
    let base_currency_id: Int
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
