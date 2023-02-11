//
//  History.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-08.
//

import Foundation

struct Result: Identifiable {
    let id = UUID()
    let stockPrice: String
    let numberOfShares: String
    let totalValue: String
    let stockPriceAtPurchase: String
    let currentStockPrice: String
    let numberOfSharesForProfit: String
    let profit: String
}

let resultForPreviews = Result(stockPrice: "", numberOfShares: "", totalValue: "", stockPriceAtPurchase: "", currentStockPrice: "", numberOfSharesForProfit: "", profit: "")

var historyForPreviews = [resultForPreviews]
