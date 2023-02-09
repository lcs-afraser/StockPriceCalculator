//
//  CalculatorView.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-08.
//

import SwiftUI

struct CalculatorView: View {
    //MARK: Stored Properties
    @State var providedStockPrice = ""
    @State var providedNumberOfShares = ""
    var result: String
    
    //MARK: Computed Properties
    var stockPriceAsOptionalDouble: Double? {
        
        guard let unwrappedStockPrice = Double(providedStockPrice) else {
            
            return nil
        }
        
        return unwrappedStockPrice
    }
    
    var numberOfSharesAsOptionalDouble: Double? {
        
        guard let unwrappedNumberOfShares = Double(providedNumberOfShares) else {
            
            return nil
        }
        
        return unwrappedNumberOfShares
    }
    
    var stockPrice: String {
        
        guard let stockPriceAsDouble = stockPriceAsOptionalDouble else {
            return "Please enter a valid price and ammount"
        }
        
        guard let numberOfSharesAsDouble = numberOfSharesAsOptionalDouble else {
            return ""
        }
        
        let totalValue = stockPriceAsDouble * numberOfSharesAsDouble
        
        return"\(totalValue.formatted(.number.precision(.fractionLength(2))))"
    }
    
    @State var priorResults: [Result] = []
    @Binding var history: [Result]
    
    
    
    //UI
    var body: some View {
        VStack(spacing: 10) {
            Group {
                //Stock Price
                Spacer(minLength: 50)
                Text("Current Stock Price")
                    .font(.title2)
                    .bold()
                
                //Make the Input
                HStack(spacing: 5) {
                    Text("$")
                    
                    TextField("0.00", text: $providedStockPrice)
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
                Text("Total Value of Holdings")
                    .font(.title2)
                    .bold()
                
                Text(stockPrice)
                
            }
            Group {
                Button(action: {
                    let latestResult = Result(stockPrice: 1, numberOfShares: 1, totalValue: 1)
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
                        ResultView(priorResult: currentResult)
                        Spacer()
                    }
                }
                Spacer()
            }
            
            .padding()
            .navigationTitle("Stock Calculator")
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CalculatorView(result: "", history: Binding.constant(historyForPreviews))
        }
    }
}
