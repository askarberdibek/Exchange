//
//  BankListView.swift
//  Exchange
//
//  Created by askar on 4/8/23.
//

import SwiftUI

struct BankListView: View {
    //@State private var fetchedBanks: [Banks] = [] // Переменная для хранения результатов запроса
    var body: some View {
        List{
            ForEach(banksdata.self, id: \.id) { bank in
                //OneBankView(bank: bank)
                //FullBankRow(bank: bank)
                OneBankView(bank: bank)
            }
        }
        .listStyle(.plain)
    }
}

struct BankListView_Previews: PreviewProvider {
    static var previews: some View {
        BankListView()
    }
}

struct OneBankView: View {
    var bank: Banks
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 4){
                Image(bank.slug)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("\(bank.title)")
                    .font(.system(.title3, design: .rounded))
            }
            HStack{
                VStack(alignment: .leading){
                    let regular = bank.rates.filter { $0.type == "regular" }
                    if !regular.isEmpty {
                        Text("Наличные:")
                        ForEach(regular, id: \.created_at) { rate in
                            Text("USD: \(rate.buy_usd) - : \(rate.sell_usd)")
                            Text("EUR: \(rate.buy_eur) - : \(rate.sell_eur)")
                            Text("RUB: \(rate.buy_rub) - : \(rate.sell_rub)")
                            Text("KZT: \(rate.buy_kzt) - : \(rate.sell_kzt)")
                        }
                    }
                }
                Spacer(minLength: 30)
                VStack(alignment: .leading){
                    let regular = bank.rates.filter { $0.type == "regular" }
                    if !regular.isEmpty {
                        Text("Безналичные:")
                        ForEach(regular, id: \.created_at) { rate in
                            Text("USD: \(rate.buy_usd) - : \(rate.sell_usd)")
                            Text("EUR: \(rate.buy_eur) - : \(rate.sell_eur)")
                            Text("RUB: \(rate.buy_rub) - : \(rate.sell_rub)")
                            Text("KZT: \(rate.buy_kzt) - : \(rate.sell_kzt)")
                        }
                    }
                }
            }
        }
    }
}

struct FullBankRow: View{
    var bank: Bank
    var body: some View{
        HStack(alignment: .top, spacing: 10){
            Image(bank.slug)
                .resizable()
                .frame(width: 35, height: 35)
                .cornerRadius(20)
            ForEach(bank.rates, id: \.created_at) { rate in
                VStack(alignment: .leading){
                    Text("\(rate.type)")
//                    Text("\(rate.buy_usd)")
//                    Text("\(rate.buy_eur)")
//                    Text("\(rate.buy_rub)")
//                    Text("\(rate.buy_kzt)")
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

struct BanksView: View{
    @State private var fetchedBanks: [Banks] = [] // Переменная для хранения результатов запроса
    
    var body: some View {
        VStack {
            // Вывод данных из fetchedBanks
            List(fetchedBanks, id: \.id) { bank in
                Text("Bank ID: \(bank.id)")
                Text("Title: \(bank.title)")
                // Остальные свойства банка
            }
        }
        .onAppear {
            loadBanks { banks in
                if let banks = banks {
                    fetchedBanks = banks // Сохраняем полученные банки
                } else {
                    //print("Неудача")
                }
            }
        }
    }
}
