//
//  SecondResultView.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-11.
//

import SwiftUI

struct SecondResultView: View {
    // MARK: Stored properties
    let secondPriorResult: Result
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 3) {
                
                Text("Stock Price")

                Text("At Purchase")

                // Divider
                Text("")
                
                Text("Current")

                Text("Stock Price")
                
                // Divider
                Text("")

                Text("Number")

                Text("Of Shares")

                // Divider
                Text("")
                
                Text("Profit")
            }
            .font(Font.custom("Courier New",
                              size: 14.0,
                              relativeTo: .body))
            .bold()

            Spacer()
            
            VStack(alignment: .trailing, spacing: 1) {

                Text("$ \(secondPriorResult.stockPriceAtPurchase)")
                
                Text("-----------")
                Text("")

                Text("$ \(secondPriorResult.currentStockPrice)")
                
                Text("-----------")
                Text("")

                Text("$ \(secondPriorResult.numberOfSharesForProfit)")
                Text("")
                Text("===========")
                
                Text("$ \(secondPriorResult.profit)")
                
            }
            .font(Font.custom("Courier New",
                              size: 14,
                              relativeTo: .body))

        }
        .padding(.horizontal)
    }
}

struct SecondResultView_Previews: PreviewProvider {
    static var previews: some View {
        SecondResultView(secondPriorResult: resultForPreviews)
    }
}
