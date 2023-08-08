//
//  BankListView.swift
//  Exchange
//
//  Created by askar on 4/8/23.
//

import SwiftUI

struct BankListView: View {
    var body: some View {
        List{
            ForEach(filejson!, id: \.id) { bank in
                OneBankView(bank: bank)
                //FullBankRow(bank: bank)
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
    var bank: Bank
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

                            Text("USD: \(rate.buy_usd ?? "N/A") - : \(rate.sell_usd ?? "N/A")")
                            Text("EUR: \(rate.buy_eur ?? "N/A") - : \(rate.sell_eur ?? "N/A")")
                            Text("RUB: \(rate.buy_rub ?? "N/A") - : \(rate.sell_rub ?? "N/A")")
                            Text("KZT: \(rate.buy_kzt ?? "N/A") - : \(rate.sell_kzt ?? "N/A")")
                        }
                    }
                }
                Spacer(minLength: 30)
                VStack(alignment: .leading){
                    let regular = bank.rates.filter { $0.type == "regular" }
                    if !regular.isEmpty {
                        Text("Безналичные:")
                        ForEach(regular, id: \.created_at) { rate in
                            Text("USD: \(rate.buy_usd ?? "N/A") - : \(rate.sell_usd ?? "N/A")")
                            Text("EUR: \(rate.buy_eur ?? "N/A") - : \(rate.sell_eur ?? "N/A")")
                            Text("RUB: \(rate.buy_rub ?? "N/A") - : \(rate.sell_rub ?? "N/A")")
                            Text("KZT: \(rate.buy_kzt ?? "N/A") - : \(rate.sell_kzt ?? "N/A")")
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


