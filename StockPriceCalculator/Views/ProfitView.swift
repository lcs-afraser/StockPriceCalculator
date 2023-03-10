//
//  ProfitView.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-11.
//

import SwiftUI

struct ProfitView: View {
    //MARK: Stored Properties
    @State var providedStockPriceAtPurchase = ""
    @State var providedCurrentStockPrice = ""
    @State var providedNumberOfShares = ""
    var result: String
    
    //MARK: Computed Properties
    var stockPriceAtPurchaseAsOptionalDouble: Double? {
        
        guard let unwrappedStockPriceAtPurchase = Double(providedStockPriceAtPurchase) else {
            
            return nil
        }
        
        return unwrappedStockPriceAtPurchase
    }
    
    var numberOfSharesAsOptionalDouble: Double? {
        
        guard let unwrappedNumberOfShares = Double(providedNumberOfShares) else {
            
            return nil
        }
        
        return unwrappedNumberOfShares
    }
    
    var currentStockPriceAsOptionalDouble: Double? {
        
        guard let unwrappedCurrentStockPrice = Double(providedCurrentStockPrice) else {
            
            return nil
        }
        
        return unwrappedCurrentStockPrice
    }
    
    var profitMade: String {
        
        guard let stockPriceAtPurchaseAsDouble = stockPriceAtPurchaseAsOptionalDouble else {
            return "Please enter valid prices and ammount"
        }
        
        guard let numberOfSharesAsDouble = numberOfSharesAsOptionalDouble else {
            return "Please enter valid prices and ammount"
        }
        
        guard let currentStockPriceAsDouble = currentStockPriceAsOptionalDouble else {
            return "Please enter valid prices and ammount"
        }
        
        let profit = (currentStockPriceAsDouble * numberOfSharesAsDouble) - (stockPriceAtPurchaseAsDouble * numberOfSharesAsDouble)
        
        return"\(profit.formatted(.number.precision(.fractionLength(2))))"
    }
    
    @State var priorResults: [Result] = []
    @Binding var history: [Result]
    
    
    
    //UI
    var body: some View {
        VStack(spacing: 5) {
            Group {
                //Stock Price At Purchase
                Spacer(minLength: 50)
                Text("Stock Price At Purchase")
                    .font(.title2)
                    .bold()
                
                //Make the Input
                HStack(spacing: 5) {
                    Text("$")
                    
                    TextField("0.00", text: $providedStockPriceAtPurchase)
                }
                .padding()
            }
            Group {
                //Current Stock Price
                Text("Current Stock Price")
                    .font(.title2)
                    .bold()
                
                //Make the Input
                HStack(spacing: 5) {
                    Text("$")
                    
                    TextField("0.00", text: $providedCurrentStockPrice)
                }
                .padding()
                
                //Number of Shares
                Group {
                    Text("Number of Shares")
                        .font(.title2)
                        .bold()
                    
                    //Make the Input
                    HStack(spacing: 5) {
                        Text("#")
                        
                        TextField("0", text: $providedNumberOfShares)
                    }
                }
                .padding()
            }
            
            //Total Value
            Group {
                Text("Profit Made")
                    .font(.title2)
                    .bold()
                
                Text(profitMade)
                
            }
            //History Button
            
            let currentPrice = String(providedCurrentStockPrice)
            
            let priceAtPurchase = String(providedStockPriceAtPurchase)
            
            let shares = String(providedNumberOfShares)
            Group {
                Button(action: {
                    let latestResult = Result(stockPrice: "", numberOfShares: "", totalValue: "", stockPriceAtPurchase: currentPrice, currentStockPrice: priceAtPurchase, numberOfSharesForProfit: shares, profit: profitMade)
                    priorResults.append(latestResult)
                }, label: {
                    Text("Save")
                })
                .buttonStyle(.bordered)
                .padding()
            }
            Group {
                //History
                HStack {
                    Text("History")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
            }
            Group {
                //The List of Results
                List(priorResults.reversed()) {  currentResult in
                    HStack {
                        Spacer()
                        SecondResultView(secondPriorResult: currentResult)
                        Spacer()
                    }
                }
                Spacer()
            }
            
            .padding()
            .navigationTitle("Profit Calculator")
        }
    }
}

struct ProfitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfitView(result: "", history: Binding.constant(historyForPreviews))
        }
    }
}
