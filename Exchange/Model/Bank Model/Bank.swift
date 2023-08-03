import Foundation

struct Bank: Codable {
    let id: Int
    let title: String
    let officialTitle: String
    let slug: String
    //let website_url: URL
    let rates: [ExchangeRate]
}

struct ExchangeRate: Codable {
    //let organization_id: Int
    //let base_currency_id: Int
    let createdAt: String
    let updatedAt: String
    let isCurrent: Int
    let type: String
    let buyUSD: String?
    let sellUSD: String?
    let buyEUR: String?
    let sellEUR: String?
    let buyRUB: String?
    let sellRUB: String?
    let buyKZT: String?
    let sellKZT: String?
    let buyUZS: String?
    let sellUZS: String?
    let buyCNY: String?
    let sellCNY: String?
    let buyGBP: String?
    let sellGBP: String?
    let buyTRY: String?
    let sellTRY: String?
}

//func decodeExchangeRates(data: Data) -> Bank? {
//    let decoder = JSONDecoder()
//    print("___1___")
//    do {
//        let exchangeRates = try decoder.decode(Bank.self, from: data)
//        print("___2___")
//        print(exchangeRates.websiteURL as Any)
//        return exchangeRates
//    } catch {
//        print("___failed___")
//        print(error.localizedDescription)
//        return nil
//    }
//}

let filejson = readJSONFromFile(named: "response", as: [Bank].self)
//let result = decodeExchangeRates(data: fileURL)


func readJSONFromFile<T: Decodable>(named filename: String, as type: T.Type) -> T? {
    if let fileURL = Bundle.main.url(forResource: filename, withExtension: "json") {
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            //decoder.keyDecodingStrategy = .convertFromSnakeCase // For snake_case JSON keys
            let decodedData = try decoder.decode(T.self, from: jsonData)
            return decodedData
        } catch {
            print("Ошибка при чтении или декодировании файла JSON: \(error)")
            return nil
        }
    } else {
        print("Файл JSON не найден")
        return nil
    }
}

