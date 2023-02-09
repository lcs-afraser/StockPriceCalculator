//
//  ResultView.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-08.
//

import SwiftUI

struct ResultView: View {
    
    // MARK: Stored properties
    let priorResult: Result
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 3) {
                
                Text("Current")

                Text("Stock Price")

                // Divider
                Text("")
                
                Text("Number")

                Text("Of Shares")
                
                // Divider
                Text("")

                Text("Total Value of Holdings")

                // Divider
                Text("")
            }
            .font(Font.custom("Courier New",
                              size: 14.0,
                              relativeTo: .body))
            .bold()

            Spacer()
            
            VStack(alignment: .trailing, spacing: 1) {

                // Amount
                Text("$ \(priorResult.stockPrice)")
                
                // Tip
                
                Text("-----------")

                // Total
                Text("$ \(priorResult.numberOfShares)")

                // People
                
                Text("-----------")
                
                // Amount per person
                Text("$ \(priorResult.totalValue)")
                
                Text("===========")
            }
            .font(Font.custom("Courier New",
                              size: 14,
                              relativeTo: .body))

        }
        .padding(.horizontal)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(priorResult: resultForPreviews)
    }
}
