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
    //let base_currency_id: Int
    let created_at: String
    let updated_at: String
    //let isCurrent: Int
    let type: String
    let buy_usd: String
    let sell_usd: String
    let buy_eur: String
    let sell_eur: String
    let buy_rub: String
    let sell_rub: String
    let buy_kzt: String
    let sell_kzt: String
    let buy_UZS: String?
    let sellUZS: String?
    let buyCNY: String?
    let sellCNY: String?
    let buyGBP: String?
    let sellGBP: String?
    let buyTRY: String?
    let sellTRY: String?
}


class DataManager: ObservableObject {
    @Published var banks: [Bank] = [] // Data storage
    
    func bankResponce(completion:  @escaping(Bank) -> Void){
        let urlString = "https://data.fx.kg/api/v1/current"
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
            
            if let data = data{
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        let bank = Bank(id: <#T##Int#>, title: <#T##String#>, official_title: <#T##String#>, slug: <#T##String#>, website_url: <#T##URL#>, rates: <#T##[ExchangeRate]#>)
                        completion(bank)
                    }
                }catch {
                    print("Ошибка при разборе JSON: \(error.localizedDescription)")
                }
            }
        }
        .resume()
    }
}



