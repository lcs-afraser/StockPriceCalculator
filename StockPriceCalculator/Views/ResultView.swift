//
//  ResultView.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-08.
//

import SwiftUI

struct ResultView: View {
    
    // MARK: Stored properties
    let somePriorResult: Result
    
    // MARK: Computed properties
    var body: some View {
        VStack(spacing: 10) {
            
            HStack(spacing: 30) {
                
            }
            
            // Output
            Text("\(somePriorResult.totalValue.formatted())")
            
                .font(Font.custom ("Times New Roman", size: 20.0, relativeTo: .body))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
    }
}
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(somePriorResult: resultForPreviews)
    }
}
