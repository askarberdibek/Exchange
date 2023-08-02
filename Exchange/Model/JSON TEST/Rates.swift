/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Rates : Codable {
	let id : Int?
	let organization_id : Int?
	let base_currency_id : Int?
	let created_at : String?
	let updated_at : String?
	let is_current : Int?
	let type : String?
	let buy_usd : String?
	let sell_usd : String?
	let buy_eur : String?
	let sell_eur : String?
	let buy_rub : String?
	let sell_rub : String?
	let buy_kzt : String?
	let sell_kzt : String?
	let buy_uzs : String?
	let sell_uzs : String?
	let buy_cny : String?
	let sell_cny : String?
	let buy_gbp : String?
	let sell_gbp : String?
	let buy_try : String?
	let sell_try : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case organization_id = "organization_id"
		case base_currency_id = "base_currency_id"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case is_current = "is_current"
		case type = "type"
		case buy_usd = "buy_usd"
		case sell_usd = "sell_usd"
		case buy_eur = "buy_eur"
		case sell_eur = "sell_eur"
		case buy_rub = "buy_rub"
		case sell_rub = "sell_rub"
		case buy_kzt = "buy_kzt"
		case sell_kzt = "sell_kzt"
		case buy_uzs = "buy_uzs"
		case sell_uzs = "sell_uzs"
		case buy_cny = "buy_cny"
		case sell_cny = "sell_cny"
		case buy_gbp = "buy_gbp"
		case sell_gbp = "sell_gbp"
		case buy_try = "buy_try"
		case sell_try = "sell_try"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		organization_id = try values.decodeIfPresent(Int.self, forKey: .organization_id)
		base_currency_id = try values.decodeIfPresent(Int.self, forKey: .base_currency_id)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		is_current = try values.decodeIfPresent(Int.self, forKey: .is_current)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		buy_usd = try values.decodeIfPresent(String.self, forKey: .buy_usd)
		sell_usd = try values.decodeIfPresent(String.self, forKey: .sell_usd)
		buy_eur = try values.decodeIfPresent(String.self, forKey: .buy_eur)
		sell_eur = try values.decodeIfPresent(String.self, forKey: .sell_eur)
		buy_rub = try values.decodeIfPresent(String.self, forKey: .buy_rub)
		sell_rub = try values.decodeIfPresent(String.self, forKey: .sell_rub)
		buy_kzt = try values.decodeIfPresent(String.self, forKey: .buy_kzt)
		sell_kzt = try values.decodeIfPresent(String.self, forKey: .sell_kzt)
		buy_uzs = try values.decodeIfPresent(String.self, forKey: .buy_uzs)
		sell_uzs = try values.decodeIfPresent(String.self, forKey: .sell_uzs)
		buy_cny = try values.decodeIfPresent(String.self, forKey: .buy_cny)
		sell_cny = try values.decodeIfPresent(String.self, forKey: .sell_cny)
		buy_gbp = try values.decodeIfPresent(String.self, forKey: .buy_gbp)
		sell_gbp = try values.decodeIfPresent(String.self, forKey: .sell_gbp)
		buy_try = try values.decodeIfPresent(String.self, forKey: .buy_try)
		sell_try = try values.decodeIfPresent(String.self, forKey: .sell_try)
	}
}
