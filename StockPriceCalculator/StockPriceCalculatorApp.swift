//
//  StockPriceCalculatorApp.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-07.
//

import SwiftUI

@main
struct StockPriceCalculatorApp: App {
    //MARK: Stored Properties
    @State var history: [Result] = []
    
    //MARK: Computed Properties
    var body: some Scene {
        WindowGroup {
            TabView {
                CalculatorView(history: $history)
                    .tabItem {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Calculator")
                    }
                HistoryView(history: $history)
                    .tabItem {
                        Image(systemName: "clock.fill")
                        Text("Review")
                    }
            }
        }
    }
}
