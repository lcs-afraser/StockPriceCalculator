//
//  History.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-08.
//

import Foundation

struct Result: Identifiable {
    let id = UUID()
    let stockPrice: Double
    let numberOfShares: Double
    let totalValue: Double
    let stockPriceAtPurchase: Double
    let currentStockPrice: Double
    let numberOfSharesForProfit: Double
    let profit: Double
}

let resultForPreviews = Result(stockPrice: 1, numberOfShares: 1, totalValue: 1, stockPriceAtPurchase: 1, currentStockPrice: 1, numberOfSharesForProfit: 1, profit: 1)

var historyForPreviews = [resultForPreviews]
