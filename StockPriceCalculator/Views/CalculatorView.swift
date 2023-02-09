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
    var stockPrice: Double? {
        
        guard let stockPriceAsDouble = Double(providedStockPrice) else {
            
            return nil
        }
        
        return stockPriceAsDouble
    }
    
    var numberOfShares: Double? {
        
        guard let numberOfSharesAsDouble = Double(providedNumberOfShares) else {
            
            return nil
        }
        
        return numberOfSharesAsDouble
    }
    
    var totalValue: Double? {
        
        guard stockPrice != nil else {
            
            return nil
            
        }
        
        
        guard numberOfShares != nil else {
            
            return nil
            
        }
        
        let totalValue = stockPrice! * numberOfShares!
        
        return totalValue
    }
    
    var totalValueAsString: String {
        
        guard totalValue != nil else {
            
            return ""
            
        }
        
        return totalValue!.formatted(.number.precision(.fractionLength(Int())))
        
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
                    
                    TextField("Input", text: $providedStockPrice)
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
                        
                        TextField("Input", text: $providedNumberOfShares)
                    }
                }
                .padding()
            }
            
            //Total Value
            Group {
                Text("Total Value of Holdings")
                    .font(.title2)
                    .bold()
                
                Text(totalValueAsString)
                
            }
            Group {
                Button(action: {
                    let latestResult = Result(stockPrice: stockPrice ?? stockPrice!, numberOfShares: numberOfShares ?? numberOfShares ?? totalValue!, totalValue: totalValue!)
                    priorResults.append(latestResult)
                }, label: {
                    Text("Save Result")
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
                        ResultView(somePriorResult: currentResult)
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
